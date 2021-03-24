#!/usr/bin/env bash
set -e

rm -rf alma.img

nice doas alma create \
    --encrypted-root \
    --aur-helper yay \
    --presets ./presets/*.toml \
    --image 20GiB alma.img \
    $@
