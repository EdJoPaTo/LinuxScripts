#!/usr/bin/env bash
set -e

rm -rf alma.img

doas alma create \
    --encrypted-root \
    --aur-helper yay \
    --presets ./presets/*.toml \
    --image 20GiB alma.img \
    $@
