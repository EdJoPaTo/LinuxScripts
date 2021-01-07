#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param rustup rust-analyzer cargo-audit cargo-edit cargo-outdated cargo-tarpaulin cargo-watch

rustup default stable

# generally used components
rustup component add clippy rustfmt

# needed by rust-analyzer
rustup component add rust-src
