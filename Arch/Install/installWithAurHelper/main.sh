#!/usr/bin/sh
set -e

EXPLICIT=(
    bottom-bin
    dive
    resvg
    starship-bin

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
