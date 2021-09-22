#!/usr/bin/env bash
set -e

EXPLICIT=(
	insomnia-bin
	jitsi-meet-desktop-bin
	mpd-mpris
	platformio
	tootle
	ttf-ms-fonts

	# create bootables
	etcher-bin
	popsicle
	ventoy-bin
)

DEPS=(
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
