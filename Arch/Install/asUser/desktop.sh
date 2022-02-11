#!/usr/bin/env bash
set -e

EXPLICIT=(
	dive
	resvg

	# create bootables
	alma-git
	popsicle
	ventoy-bin

	# Rust
	cargo-diet # minimal cargo packages
	cargo-geiger # find unsafe in dependencies
	cargo-license
)

if [ "$(uname -m)" == "x86_64" ]; then
EXPLICIT+=(
	insomnia-bin
	jitsi-meet-desktop-bin

	# create bootables
	etcher-bin
)
fi

DEPS=(
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
