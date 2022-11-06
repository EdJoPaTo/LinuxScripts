#!/usr/bin/env bash
set -eu

# nautilus-open-any-terminal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty

gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.calendar show-weekdate true

EXTENSIONS=(
	caffeine@patapon.info
	system-monitor@paradoxxx.zero.gmail.com
)

for extension in "${EXTENSIONS[@]}"; do
	gnome-extensions enable "$extension"
done
