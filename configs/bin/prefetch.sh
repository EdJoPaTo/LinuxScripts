#!/usr/bin/env sh
set -eu

# Fetch updates without changing the state of a project.
# Helpful to prepare for travel as stuff is probably already downloaded then.

splitter() {
	printf '\n#\n##\n### %s\n\n' "$*"
}

splitter_when_command() {
	command -v "$1" >/dev/null 2>/dev/null &&
		splitter "$*"
}

git_fetch_dir() {
	if [ -d "$1" ]; then
		splitter git fetch in "$1"
		project-below --base-dir="$1" --directory=.git --result=non-zero git fetch --all --recurse-submodules
	fi
}

git_fetch_dir "$HOME/.cache/paru/clone"
git_fetch_dir "$HOME/.local/share/nvim/lazy"
git_fetch_dir "$HOME/git"

cd "$HOME"

splitter_when_command tldr --update && tldr --update

splitter_when_command deno cache &&
	project-below --file='deno.json*' --output=null --result=always \
		deno cache --allow-import --node-modules-dir=false ./**/*.ts

splitter_when_command cargo-prefetch &&
	project-below --file=Cargo.toml --result=non-zero cargo-prefetch
