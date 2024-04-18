#!/usr/bin/env bash
set -eu -o pipefail

mkdir -p ~/.cache/eto-aurinstall

function installaurpackage {
	cd ~/.cache/eto-aurinstall

	git clone --depth 1 "https://aur.archlinux.org/$1.git"
	cd "$1"
	git pull --recurse
	nice makepkg -sric --needed --noconfirm
}

installaurpackage paru-bin

paru --gendb
