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
	python-esphome-dashboard
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
