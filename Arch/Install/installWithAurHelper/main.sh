#!/usr/bin/env bash
set -e

EXPLICIT=(
    bottom-bin
    dive
    heliocron-bin
    nvm
    resvg

    # Rust
    cargo-flamegraph
    ## minimal cargo packages
    cargo-diet
    ## analyze dependencies
    cargo-geiger
    cargo-license
)

sudo pacman -Sy

./installWithAurHelper.sh "${EXPLICIT[@]}"
