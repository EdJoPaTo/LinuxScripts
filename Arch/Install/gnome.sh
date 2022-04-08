#!/usr/bin/env bash
set -e

EXPLICIT=(
	gdm

	# gnome basis
	gnome-backgrounds
	gnome-keyring
	gnome-screenshot
	gnome-shell-extensions

	# gnome tools
	evince # document viewer (PDF, …)
	gedit
	gnome-power-manager
	gnome-software
	gnome-terminal
	gnome-tweaks
	nautilus
	sushi
)

DEPS=(
	fwupd
	gnome-control-center
)

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
