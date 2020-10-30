#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param rustup cargo-edit cargo-tarpaulin cargo-watch

rustup default stable
rustup toolchain install stable
