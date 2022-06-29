#!/usr/bin/env bash
set -eu

EXPLICIT=(
	esphome
	nvm
	paru-bin
	platformio
	tootle
	ttf-ms-fonts
)

DEPS=(
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
