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

const packageDetails: Record<string, string> = {};
async function preloadPackageDetails(
	packages: readonly string[],
): Promise<void> {
	const AMOUNT = navigator.hardwareConcurrency;
	const needed = packages.filter((p) => !packageDetails[p]);
	for (let i = 0; i < needed.length; i += AMOUNT) {
		const slice = needed.slice(i, i + AMOUNT);
		await Promise.all(slice.map(async (p) => {
			packageDetails[p] = await exec("pacman", "-Qi", p);
		}));
	}
}
function isRequired(packageName: string): boolean {
	return !packageDetails[packageName].includes("Required By     : None");
}

const allExplicitsRaw = await exec("pacman", "-Qeq");
const allExplicits = allExplicitsRaw.split("\n").filter(Boolean);
await preloadPackageDetails(allExplicits);
console.log("allExplicits", allExplicits.length);

const allDependenciesRaw = await exec("pacman", "-Qdq");
const allDependencies = allDependenciesRaw.split("\n").filter(Boolean);
await preloadPackageDetails(allDependencies);
console.log("allDependencies", allDependencies.length);

const onlyOptionals = allDependencies.filter(p => !isRequired(p));
console.log("optional", onlyOptionals.length, onlyOptionals.join(" "));
console.log();

const onlyExplicitDependencies = allExplicits.filter(isRequired);
console.log(
	"explicit&required",
	onlyExplicitDependencies.length,
	onlyExplicitDependencies.join(" "),
);
