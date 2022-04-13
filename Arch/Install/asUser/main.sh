#!/usr/bin/env bash
set -e

EXPLICIT=(
	esphome
	firefox-extension-localcdn
	nvm
	platformio
	tootle
	ttf-ms-fonts
)

DEPS=(
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
