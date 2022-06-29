#!/usr/bin/env bash

# Find out installed ones: `code --list-extensions`

packages=(
	DavidAnson.vscode-markdownlint
	EditorConfig.EditorConfig
	esbenp.prettier-vscode
	timonwong.shellcheck
	VisualStudioExptTeam.vscodeintellicode

	# Programming Language Support
	af4jm.vscode-icalendar
	coolbear.systemd-unit-file
	denoland.vscode-deno
	macabeus.vscode-fluent
	redhat.vscode-xml
	redhat.vscode-yaml

	# TeX and natural language
	davidlday.languagetool-linter
	James-Yu.latex-workshop
	valentjn.vscode-ltex

	# Microcontroller
	ms-vscode.cpptools
	platformio.platformio-ide

	# Rust
	bungcip.better-toml
	rust-lang.rust-analyzer
	serayuzgur.crates
)

for package in "${packages[@]}"
do
	code --force --install-extension "$package"
done
