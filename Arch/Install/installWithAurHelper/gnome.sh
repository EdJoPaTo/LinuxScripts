#!/usr/bin/sh
set -e

EXPLICIT=(
    gnome-shell-extension-sound-output-device-chooser
    gnome-shell-extension-system-monitor-git
    nautilus-open-any-terminal
)

sudo pacman -Sy

./installWithAurHelper.sh "${EXPLICIT[@]}"

# nautilus-open-any-terminal
gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty


echo
echo "install extensions manually:"
echo https://extensions.gnome.org/extension/600/launch-new-instance/
echo https://extensions.gnome.org/extension/7/removable-drive-menu/
echo https://extensions.gnome.org/extension/517/caffeine/
