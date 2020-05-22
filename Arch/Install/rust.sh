#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param rustup

rustup default stable
rustup toolchain install stable

# Rust Language Server needed in Visual Studio Code
rustup component add rls rust-analysis rust-src
