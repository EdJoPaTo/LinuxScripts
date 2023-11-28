#!/usr/bin/env bash
set -eu

EXPLICIT=(
	chayang-git # gradually dim the screen
	code-marketplace
	etcher-bin
	gnome-shell-extension-blur-my-shell
	gnome-shell-extension-system-monitor-next-git
	mpd-mpris
	mpdris2
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
