#!/usr/bin/env bash
set -e

mkdir -p ~/.cache/eto-aurinstall

function dothestuff {
  cd ~/.cache/eto-aurinstall

  git clone https://aur.archlinux.org/$1.git
  cd $1
  git pull --recurse
  nice makepkg -sric --needed --noconfirm
}

for var in "$@"
do
  dothestuff "$var"
done
