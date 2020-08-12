#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

./installaurpackage.sh yay-bin

yay --save --batchinstall --combinedupgrade --noremovemake --nodiffmenu --sudoloop
