#!/usr/bin/env bash
set -eu

EXPLICIT=(
	code-marketplace
	dockerfile-language-server
	esphome
	mpd-mpris
	nvm
	paru-bin
	platformio
	ttf-ms-fonts
)

DEPS=(
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
