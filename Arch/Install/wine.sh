#!/usr/bin/env bash
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

# mono
sudo pacman $param mono

# wine
sudo pacman $param wine winetricks wine-gecko wine-mono
