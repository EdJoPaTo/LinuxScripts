#!/usr/bin/sh
set -e

EXPLICIT=(
    cargo-flamegraph

    # minimal cargo packages
    cargo-diet

    # analyze dependencies
    cargo-geiger
    cargo-license
)

./installWithAurHelper.sh "${EXPLICIT[@]}"
