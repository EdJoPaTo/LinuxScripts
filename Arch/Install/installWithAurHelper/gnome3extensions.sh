#!/usr/bin/sh
set -e

EXPLICIT=(
    gnome-shell-extension-sound-output-device-chooser
    gnome-shell-extension-system-monitor-git
)

./installWithAurHelper.sh "${EXPLICIT[@]}"

echo
echo "manually:"
echo https://extensions.gnome.org/extension/600/launch-new-instance/
echo https://extensions.gnome.org/extension/7/removable-drive-menu/
echo https://extensions.gnome.org/extension/517/caffeine/
