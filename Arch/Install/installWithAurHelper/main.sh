#!/usr/bin/env bash
set -e

EXPLICIT=(
    alma-git
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

./installWithAurHelper.sh "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
