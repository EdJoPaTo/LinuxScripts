#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param rustup

rustup default stable
rustup toolchain install stable
