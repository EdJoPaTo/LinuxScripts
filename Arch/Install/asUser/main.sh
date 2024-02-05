#!/usr/bin/env bash
set -u

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

# Show info about package when available on the official repos
# This should either error or be migrated to the non AUR installation
pacman -Sqi "${DEPS[@]}" "${EXPLICIT[@]}" 2>/dev/stdout | rg -v 'was not found'

set -eu -o pipefail
nice paru --sudo sudo --sudoloop --skipreview --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
