#!/usr/bin/env bash
set -e

EXPLICIT=(
	insomnia-bin
	mqtt-explorer-appimage
	platformio
	tootle
	ttf-ms-fonts

	# music
	mp3diags-unstable
	mpd-mpris

	# create bootables
	etcher-bin
	popsicle
	ventoy-bin

	# uff communication
	zoom
)

DEPS=(
	# Zoom optional dependencies - not sure if really needed
	picom
	xcompmgr
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
