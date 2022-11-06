#!/usr/bin/env bash
set -eu

EXPLICIT=(
	ckb-next-git
)

nice paru --sudo sudo --sudoloop --skipreview --noconfirm --needed -Sy --asdeps "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"

sudo systemctl enable --now ckb-next-daemon.service
