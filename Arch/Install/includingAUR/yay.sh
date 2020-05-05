#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

./installaurpackage.sh yay-bin
