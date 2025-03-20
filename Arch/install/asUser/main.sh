#!/usr/bin/env bash
set -u

EXPLICIT=(
	etcher-bin
	gnome-shell-extension-blur-my-shell
	gnome-shell-extension-system-monitor-next-git
	nautilus-open-any-terminal
	paru-bin
	ventoy-bin
)

DEPS=(
)

# Show info about package when available on the official repos
# This should either error or be migrated to the non AUR installation
pacman -Sqi "${DEPS[@]}" "${EXPLICIT[@]}" 2>/dev/stdout | rg -v 'was not found'

set -eu -o pipefail
nice paru --sudo sudo --sudoloop --skipreview --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
