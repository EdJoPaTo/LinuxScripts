#!/usr/bin/env node

import { execFileSync, spawnSync } from "node:child_process";
import { existsSync, mkdtempDisposableSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { cwd, env } from "node:process";

const COMMANDS = {
	"Cargo.lock":
		"CARGO_RESOLVER_INCOMPATIBLE_RUST_VERSIONS=fallback cargo update --quiet",
	"deno.lock":
		"rm -f deno.lock && fd --extension ts --exec-batch deno cache --reload",
	"package-lock.json":
		"rm -f package-lock.json && npm install --no-audit --no-fund --no-update-notifier --package-lock-only",
} as const;

const HOME = env["HOME"];
if (!HOME) {
	throw new Error("Your shell should set your HOME directory as env");
}

function updateLockfiles(dir: string) {
	function git(...args: string[]): string {
		return execFileSync("git", args, { cwd: dir, encoding: "utf8" });
	}

	function willPushBeRelevant() {
		try {
			const stdout = git("diff", "--shortstat", "origin/lockfiles");
			return stdout.length > 0;
		} catch {
			return true;
		}
	}

	for (const [lockfile, command] of Object.entries(COMMANDS)) {
		if (!existsSync(dir + "/" + lockfile)) {
			continue;
		}

		console.log("run update command for", lockfile, "...");

		const result = spawnSync(
			"/usr/bin/nice",
			["bash", "-rlc", "set -x && " + command],
			{
				cwd: dir,
				env: { HOME },
				stdio: ["ignore", "inherit", "inherit"],
			},
		);

		if (result.status !== 0) {
			throw new Error("Update lockfile command was not successful");
		}
	}

	const changesOutput = git("status", "--porcelain");
	const changesLines = changesOutput.split("\n").filter(Boolean);
	const hasChanges = changesLines.length > 0;
	console.log("all update commands done. hasChanges", hasChanges, changesLines);

	if (!hasChanges) {
		// No changes -> delete remote branch

		try {
			git("show-ref", "--verify", "--quiet", "refs/remotes/origin/lockfiles");
			// successful -> remote branch exists
			git("push", "--quiet", "origin", ":lockfiles");
		} catch {
			// failed -> no remote branch exists, everything as it should be
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

const prefix = `git-lockfiles-${cwd()}-`.replaceAll(/[^a-zA-Z0-9]+/g, "-");
using worktree = mkdtempDisposableSync(join(tmpdir(), prefix));

execFileSync("git", [
	"worktree",
	"add",
	"--quiet",
	"--no-track",
	"-Blockfiles",
	worktree.path,
	"origin/main",
]);
updateLockfiles(worktree.path);
execFileSync("git", ["worktree", "remove", worktree.path]);
execFileSync("git", ["branch", "--quiet", "-D", "lockfiles"]);
