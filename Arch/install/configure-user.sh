#!/usr/bin/env bash
set -eux -o pipefail

if [ "$USER" == "root" ]; then
	echo "Do not run as root, run as your user"
	exit 1
fi

# podman rootless usage
sudo usermod --add-subuids 165536-231072 --add-subgids 165536-231072 "$USER"
# in case of problems run as user: podman system migrate

# Allow serial communication for users (Platformio, Arduino)
sudo usermod -aG uucp,lock "$USER"

# enable services for niri
mkdir -p ~/.config/systemd/user/niri.service.wants/
ln --verbose --symbolic --force /usr/lib/systemd/user/waybar.service ~/.config/systemd/user/niri.service.wants/

systemctl --user disable mpd.service
systemctl --user enable --now mpd.socket mpd-mpris.service

xdg-mime default firefox.desktop text/html
xdg-settings set default-web-browser firefox.desktop

tldr --update
