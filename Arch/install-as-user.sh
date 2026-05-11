#!/usr/bin/env bash
set -u

if [ "$USER" = "root" ]; then
	echo "Do not run as root, run as your user"
	exit 1
fi

EXPLICIT=(
	ckb-next-git
	gnome-shell-extension-blur-my-shell
	gnome-shell-extension-system-monitor-next-git
	nautilus-open-any-terminal
	obs-pipewire-audio-capture
	paru
	ventoy-bin
)

DEPS=(
)

# Show info about package when available on the official repos
# This should either error or be migrated to the non AUR installation
pacman -Sqi "${DEPS[@]}" "${EXPLICIT[@]}" 2>/dev/stdout | rg -v 'was not found'

set -eu -o pipefail

nice paru --sudo /usr/bin/sudo --sudoloop --skipreview -Sy --needed --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"

sudo systemctl enable --now ckb-next-daemon.service
