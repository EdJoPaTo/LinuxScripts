#!/usr/bin/env bash

# Find out installed ones: `code --list-extensions`

packages=(
	EditorConfig.EditorConfig
	af4jm.vscode-icalendar
	coolbear.systemd-unit-file
	davidlday.languagetool-linter
	denoland.vscode-deno
	esbenp.prettier-vscode
	ms-vscode.cpptools
	platformio.platformio-ide
	redhat.vscode-xml
	redhat.vscode-yaml
	timonwong.shellcheck

	# Rust
	matklad.rust-analyzer
	bungcip.better-toml
	serayuzgur.crates
)

for package in "${packages[@]}"
do
	code --force --install-extension "$package"
done
