#!/usr/bin/env bash
set -eu

EXPLICIT=(
	code-marketplace
	dive
	gnome-browser-connector
	gnome-shell-extension-caffeine-git
	gnome-shell-extension-system-monitor-git
	mpd-mpris
	nautilus-open-any-terminal
	nvm
	paru-bin
	platformio
	rpi-imager
)

DEPS=(
)

if [ "$(uname -m)" == "x86_64" ]; then
EXPLICIT+=(
	jitsi-meet-desktop-bin
)
fi

nice paru --sudo sudo --sudoloop --skipreview --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
