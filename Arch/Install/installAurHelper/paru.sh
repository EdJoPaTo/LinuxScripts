#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

# Switch to paru-bin and remove make dep when available for arm64
# https://github.com/Morganamilo/paru/issues/83
sudo pacman $param cargo

./installaurpackage.sh paru

paru --gendb
