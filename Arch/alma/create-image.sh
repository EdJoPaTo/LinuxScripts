#!/usr/bin/env bash
set -eux

rm -rf alma.img

nice doas alma create \
	--encrypted-root \
	--aur-helper paru \
	--presets ./presets/*.toml \
	--image 25GiB alma.img \
	"$@"
