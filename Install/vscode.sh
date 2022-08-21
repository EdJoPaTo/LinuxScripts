#!/usr/bin/env bash

# Find out installed ones: `code --list-extensions`

packages=(
	bungcip.better-toml
	DavidAnson.vscode-markdownlint
	davidlday.languagetool-linter
	denoland.vscode-deno
	EditorConfig.EditorConfig
	James-Yu.latex-workshop
	macabeus.vscode-fluent
	platformio.platformio-ide
	redhat.vscode-yaml
	rust-lang.rust-analyzer
	serayuzgur.crates
	timonwong.shellcheck
	valentjn.vscode-ltex
	VisualStudioExptTeam.vscodeintellicode
)

for package in "${packages[@]}"
do
	code --force --install-extension "$package"
done
