#!/usr/bin/env bash
set -eu

EXPLICIT=(
	ckb-next-git
)

./installWithAurHelper.sh "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"

sudo systemctl enable --now ckb-next-daemon.service
