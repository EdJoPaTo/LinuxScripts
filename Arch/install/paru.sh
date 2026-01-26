#!/usr/bin/env sh
set -eu

if [ "$USER" = "root" ]; then
	echo "Do not run as root, run as your user"
	exit 1
fi

mkdir -p ~/.cache/paru/clone

installaurpackage() {
	cd ~/.cache/paru/clone
	git clone --depth=1 "https://aur.archlinux.org/$1"
	cd "$1"
	nice makepkg --syncdeps --clean --install --needed --asdeps --noconfirm
}

pacman -Qq paru >/dev/null 2>/dev/null || installaurpackage paru
sudo pacman -D --asexplicit --quiet paru

paru --gendb
