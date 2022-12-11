async function exec(cmd: [string, ...string[]]): Promise<string> {
  const process = Deno.run({ cmd, stdout: "piped" });
  const status = await process.status();
  if (!status.success) {
    throw new Error(`Command ${cmd[0]} was not successful`);
  }

  const outputBuffer = await process.output();
  const output = new TextDecoder().decode(outputBuffer);
  return output;
}

const allDependenciesRaw = await exec(["pacman", "-Qdq"]);
const allDependencies = allDependenciesRaw.split("\n").filter(Boolean);

console.log("allDependencies", allDependencies.length);

const onlyOptionalsUnfiltered = await Promise.all(
  allDependencies.map(async (p) => {
    const output = await exec(["pacman", "-Qi", p]);
    const isRequired = !output.includes("Required By     : None");
    return isRequired ? "" : p;
  }),
);
const onlyOptionals = onlyOptionalsUnfiltered.filter(Boolean);

console.log("optional packages", onlyOptionals.length, onlyOptionals.join(" "));
