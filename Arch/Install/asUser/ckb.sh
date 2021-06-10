#!/usr/bin/env bash
set -e

EXPLICIT=(
	ckb-next-git
)

./installWithAurHelper.sh "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"

sudo systemctl enable --now ckb-next-daemon
