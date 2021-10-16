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
	baobab # Disk Usage Analyzer
	eog # image viewer
	evince # document viewer (PDF, …)
	file-roller # archives
	gedit
	gnome-calculator
	gnome-disk-utility
	gnome-power-manager
	gnome-terminal
	gnome-tweaks
	gucharmap
	nautilus
)

DEPS=(
	eog-plugins
	gnome-control-center

	# remote locations
	gvfs-afc
	gvfs-smb
	gvfs-gphoto2
	gvfs-mtp
	gvfs-goa
	gvfs-nfs
	gvfs-google

	# file-roller optionals
	lrzip
	p7zip
	squashfs-tools
	unace
	unrar
)

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
