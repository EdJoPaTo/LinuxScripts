#!/usr/bin/env bash
set -eu -o pipefail

if [ "$USER" == "root" ]; then
	echo "Do not run as root, run as your user"
	exit 1
fi

mkdir -p ~/.cache/paru/clone

function installaurpackage {
	cd ~/.cache/paru/clone
	git clone --depth=1 "https://aur.archlinux.org/$1"
	cd "$1"
	nice makepkg --syncdeps --clean --install --needed --asdeps --noconfirm
}

pacman -Qq paru >/dev/null 2>/dev/null || installaurpackage paru-bin
sudo pacman -D --asexplicit --quiet paru-bin

paru --gendb
