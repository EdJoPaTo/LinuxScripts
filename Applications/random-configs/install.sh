#!/usr/bin/env bash
set -e

# verbose relative symbolic force
lnoptions="-vrsf"

mkdir -p "$HOME/.config/alacritty"
ln $lnoptions "$(pwd)/alacritty.yml" "$HOME/.config/alacritty/"

mkdir -p "$HOME/.config/dive"
ln $lnoptions "$(pwd)/dive.yaml" "$HOME/.config/dive/"

mkdir -p "$HOME/.config/htop"
ln $lnoptions "$(pwd)/htoprc" "$HOME/.config/htop/"
