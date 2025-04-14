#!/usr/bin/env bash
set -u

if [ "$USER" == "root" ]; then
	echo "Do not run as root, run as your user"
	exit 1
fi

EXPLICIT=(
	ckb-next-git
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

function installaurpackage {
	mkdir -p ~/.cache/paru/clone
	git clone --depth=1 https://aur.archlinux.org/"$1" ~/.cache/paru/clone/"$1"
	cd ~/.cache/paru/clone/"$1"
	nice makepkg --syncdeps --clean --install --needed --asdeps --noconfirm
}

pacman -Qq paru >/dev/null 2>/dev/null || installaurpackage paru-bin

paru --gendb

nice paru --sudo sudo --sudoloop --skipreview -Sy --needed --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"

sudo systemctl enable --now ckb-next-daemon.service
