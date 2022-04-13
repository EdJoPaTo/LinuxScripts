#!/usr/bin/env bash
set -e

EXPLICIT=(
	dive
	gnome-obfuscate

	# create bootables
	alma-git
	rpi-imager
	ventoy-bin

	# Rust
	cargo-diet # minimal cargo packages
	cargo-license
)

if [ "$(uname -m)" == "x86_64" ]; then
EXPLICIT+=(
	jitsi-meet-desktop-bin

	# create bootables
	etcher-bin
)
fi

DEPS=(
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
