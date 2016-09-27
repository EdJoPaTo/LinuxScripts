#!/bin/bash

mkdir -p ~/.aurinstall

function dothestuff {
	cd ~/.aurinstall

	git clone https://aur.archlinux.org/$1.git
	cd $1
	git pull --recurse
	makepkg -sric --needed --noconfirm
}

for var in "$@"
do
	dothestuff "$var"
done

