#!/bin/bash

# Find out installed ones: `code --list-extensions`

packages=(
    coolbear.systemd-unit-file
    EditorConfig.EditorConfig

    matklad.rust-analyzer
    bungcip.better-toml
    serayuzgur.crates

    platformio.platformio-ide
)

for package in "${packages[@]}"
do
	code --force --install-extension $package
done
