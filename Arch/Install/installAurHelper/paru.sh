#!/usr/bin/sh
set -e

# Switch to paru-bin and remove make dep when available for arm64
# https://github.com/Morganamilo/paru/issues/83
sudo pacman --noconfirm --needed -Sy cargo

./installaurpackage.sh paru

paru --gendb
