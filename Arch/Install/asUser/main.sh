#!/usr/bin/env bash
set -eu

EXPLICIT=(
	code-marketplace
	etcher-bin
	gnome-shell-extension-blur-my-shell
	gnome-shell-extension-system-monitor-next-git
	mpd-mpris
	nautilus-open-any-terminal
	nvm
	paru-bin
	ventoy-bin
	wdisplays # temporary update display config
)

DEPS=(
)

nice paru --sudo sudo --sudoloop --skipreview --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
