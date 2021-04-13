#!/usr/bin/env bash
set -e

# Find out installed ones: `code --list-extensions`

packages=(
    coolbear.systemd-unit-file
    davidlday.languagetool-linter
    EditorConfig.EditorConfig
    esbenp.prettier-vscode
    redhat.vscode-xml
    redhat.vscode-yaml

    matklad.rust-analyzer
    bungcip.better-toml
    serayuzgur.crates

    # For whatever reason, it does not like to be installed from command line
    #platformio.platformio-ide
)

for package in "${packages[@]}"
do
	code --force --install-extension $package
done
