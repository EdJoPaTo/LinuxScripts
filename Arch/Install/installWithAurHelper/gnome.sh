#!/usr/bin/sh
set -e

EXPLICIT=(
    gnome-shell-extension-caffeine-git
    gnome-shell-extension-sound-output-device-chooser
    gnome-shell-extension-system-monitor-git
    gnome-shell-extensions # drive-menu and launch-new-instance
    nautilus-open-any-terminal
)

sudo pacman -Sy

./installWithAurHelper.sh "${EXPLICIT[@]}"

# nautilus-open-any-terminal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty

EXTENSIONS=(
    caffeine@patapon.info
    drive-menu@gnome-shell-extensions.gcampax.github.com
    launch-new-instance@gnome-shell-extensions.gcampax.github.com
    sound-output-device-chooser@kgshank.net
    system-monitor@paradoxxx.zero.gmail.com
)

for extension in "${EXTENSIONS[@]}"; do
    gnome-extensions enable $extension
done