#!/usr/bin/env bash

# Find out installed ones: `code --list-extensions`

packages=(
	DavidAnson.vscode-markdownlint
	denoland.vscode-deno
	EditorConfig.EditorConfig
	James-Yu.latex-workshop
	macabeus.vscode-fluent
	platformio.platformio-ide
	redhat.vscode-yaml
	rust-lang.rust-analyzer
	serayuzgur.crates
	tamasfe.even-better-toml
	timonwong.shellcheck
	valentjn.vscode-ltex
)

shopt -s expand_aliases
type codium &>/dev/null && alias code='codium'

for package in "${packages[@]}"; do
	code --force --install-extension "$package"
done
