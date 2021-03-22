#!/usr/bin/env bash
set -e

mkdir -p "$HOME/.config/mpd"
mkdir -p "$HOME/.cache/mpd"
# Assume the default english xdg music folder (https://wiki.archlinux.org/index.php/XDG_user_directories)
mkdir -p "$HOME/Music"

# verbose relative symbolic force
lnoptions="-vrsf"

ln $lnoptions "$(pwd)/mpd.conf" "$HOME/.config/mpd/mpd.conf"

systemctl enable --user --now mpd.service
