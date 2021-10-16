#!/usr/bin/env bash
set -e

EXPLICIT=(
	nvm
	resvg
)

DEPS=(
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
