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
	eog
	evince
	file-roller
	gedit
	gnome-calculator
	gnome-disk-utility
	gnome-mines
	gnome-power-manager
	gnome-sudoku
	gnome-terminal
	gnome-tweaks
	gnome-weather
	gucharmap
	nautilus
)

DEPS=(
	eog-plugins
	gnome-control-center
	system-config-printer

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
