#!/usr/bin/env -S deno run --allow-run=pacman

export async function exec(cmd: string, ...args: string[]): Promise<string> {
	const process = new Deno.Command(cmd, { args, stdout: "piped" }).spawn();
	const status = await process.status;
	if (!status.success) {
		throw new Error(`Command ${cmd} was not successful`);
	}

	const { stdout: outputBuffer } = await process.output();
	const output = new TextDecoder().decode(outputBuffer);
	return output;
}

const allExplicitsRaw = await exec("pacman", "-Qeq");
const allExplicits = allExplicitsRaw.split("\n").filter(Boolean);
console.log("allExplicits", allExplicits.length);

const allDependenciesRaw = await exec("pacman", "-Qdq");
const allDependencies = allDependenciesRaw.split("\n").filter(Boolean);
console.log("allDependencies", allDependencies.length);

const onlyOptionalsUnfiltered = await Promise.all(
	allDependencies.map(async (p) => {
		const output = await exec("pacman", "-Qi", p);
		const isRequired = !output.includes("Required By     : None");
		return isRequired ? "" : p;
	}),
);
const onlyOptionals = onlyOptionalsUnfiltered.filter(Boolean);

console.log("optional", onlyOptionals.length, onlyOptionals.join(" "));
console.log();

const unfiltered = await Promise.all(
	allExplicits.map(async (p) => {
		const output = await exec("pacman", "-Qi", p);
		const isRequired = !output.includes("Required By     : None");
		return isRequired ? p : "";
	}),
);
const onlyExplicitDependencies = unfiltered.filter(Boolean);

console.log(
	"explicit&required",
	onlyExplicitDependencies.length,
	onlyExplicitDependencies.join(" "),
);
