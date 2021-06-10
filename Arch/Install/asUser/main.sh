#!/usr/bin/env bash
set -e

EXPLICIT=(
	alma-git
	dive
	nvm
	resvg
	webwormhole-git

	# Rust
	cargo-diet # minimal cargo packages
	cargo-flamegraph
	cargo-geiger # find unsafe in dependencies
	cargo-license
)

./installWithAurHelper.sh "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
