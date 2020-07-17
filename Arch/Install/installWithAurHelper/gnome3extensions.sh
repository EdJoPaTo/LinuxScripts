#!/usr/bin/sh
set -e

# Backend to be used from firefox or chrome
./installWithAurHelper.sh chrome-gnome-shell

./installWithAurHelper.sh gnome-shell-extension-system-monitor-git

echo
echo "manually:"
echo https://extensions.gnome.org/extension/600/launch-new-instance/
echo https://extensions.gnome.org/extension/7/removable-drive-menu/
echo https://extensions.gnome.org/extension/517/caffeine/
