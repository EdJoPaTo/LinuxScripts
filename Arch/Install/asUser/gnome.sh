#!/usr/bin/env bash
set -eu

EXPLICIT=(
	gnome-browser-connector
	gnome-console
	gnome-shell-extension-caffeine-git
	gnome-shell-extension-sound-output-device-chooser
	gnome-shell-extension-system-monitor-git
	gnome-shell-extensions # drive-menu
	gnome-text-editor
	nautilus-open-any-terminal
)

./installWithAurHelper.sh "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"

# nautilus-open-any-terminal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty

gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.calendar show-weekdate true

EXTENSIONS=(
	caffeine@patapon.info
	drive-menu@gnome-shell-extensions.gcampax.github.com
	sound-output-device-chooser@kgshank.net
	system-monitor@paradoxxx.zero.gmail.com
)

for extension in "${EXTENSIONS[@]}"; do
	gnome-extensions enable "$extension"
done
