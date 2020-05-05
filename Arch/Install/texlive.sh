#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param texlive-most
