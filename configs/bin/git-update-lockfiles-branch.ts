#!/usr/bin/env -S deno run --allow-env=HOME --allow-read=/tmp --allow-write=/tmp --allow-run

import { existsSync } from "node:fs";

const COMMANDS = {
	"Cargo.lock":
		"CARGO_RESOLVER_INCOMPATIBLE_RUST_VERSIONS=fallback cargo update --quiet",
	"deno.lock":
		"rm -f deno.lock && fd --extension ts --exec-batch deno cache --reload",
	"package-lock.json":
		"rm -f package-lock.json && npm install --no-audit --no-fund --no-update-notifier --package-lock-only",
} as const;

const HOME = Deno.env.get("HOME")!;
if (!HOME) {
	throw new Error("Your shell should set your HOME directory as env");
}

async function exec(cmd: string, ...args: string[]): Promise<void> {
	const process = new Deno.Command(cmd, { args }).spawn();
	const status = await process.status;
	if (!status.success) {
		Deno.exit(1);
	}
}

async function updateLockfiles(dir: string) {
	function git(...args: string[]): string {
		const output = new Deno.Command("git", {
			args,
			cwd: dir,
		}).outputSync();
		if (!output.success) {
			throw new Error(`git command was not successful: ${args}`);
		}

		return new TextDecoder().decode(output.stdout);
	}

	function willPushBeRelevant() {
		const output = new Deno.Command("git", {
			args: ["diff", "--shortstat", "origin/lockfiles"],
			cwd: dir,
		}).outputSync();
		if (!output.success) return true;
		const stdout = new TextDecoder().decode(output.stdout);
		return stdout.length > 0;
	}

	for (const [lockfile, command] of Object.entries(COMMANDS)) {
		if (!existsSync(dir + "/" + lockfile)) {
			continue;
		}

		console.log("run update command for", lockfile, "...");

		const process = new Deno.Command("/usr/bin/nice", {
			args: ["bash", "-rlc", "set -x && " + command],
			clearEnv: true,
			cwd: dir,
			env: { HOME },
		}).spawn();
		const status = await process.status;
		if (!status.success) {
			throw new Error("Update lockfile command was not successful");
		}
	}

	const changesOutput = git("status", "--porcelain");
	const changesLines = changesOutput.split("\n").filter(Boolean);
	const hasChanges = changesLines.length > 0;
	console.log("all update commands done. hasChanges", hasChanges, changesLines);

	if (!hasChanges) {
		// No changes -> delete remote branch

		const remoteBranchExists = new Deno.Command("git", {
			args: [
				"show-ref",
				"--verify",
				"--quiet",
				"refs/remotes/origin/lockfiles",
			],
			cwd: dir,
		}).outputSync().success;
		if (remoteBranchExists) {
			git("push", "--quiet", "origin", ":lockfiles");
		}

		return;
	}

	git("commit", "--all", "--message=build: update lockfiles");

	if (willPushBeRelevant()) {
		git("push", "--force-with-lease", "origin", "lockfiles");
	} else {
		console.log("lockfiles are already the same as origin/lockfiles");
	}
}

const prefix = `git-lockfiles-${Deno.cwd()}-`.replaceAll(
	/[^a-zA-Z0-9]+/g,
	"-",
);
const tmpdir = await Deno.makeTempDir({ prefix });

await exec(
	"git",
	"worktree",
	"add",
	"--quiet",
	"--no-track",
	"-Blockfiles",
	tmpdir,
	"origin/main",
);
await updateLockfiles(tmpdir);
await exec("git", "worktree", "remove", tmpdir);
await exec("git", "branch", "--quiet", "-D", "lockfiles");
