#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

# mono
sudo pacman $param mono

# wine
sudo pacman $param wine winetricks wine_gecko wine-mono
