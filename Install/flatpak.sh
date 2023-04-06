#!/usr/bin/env bash
set -eu

EXPLICIT=(
	org.raspberrypi.rpi-imager
)

flatpak remote-add --user --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo

flatpak install --user gnome-nightly org.gnome.Fractal.Devel

flatpak install "${EXPLICIT[@]}"
