#!/usr/bin/env bash
set -eux

if [ "$USER" == "root" ]; then
	echo "Do not run as root, run as your user"
	exit 1
fi

# podman rootless usage
sudo usermod --add-subuids 165536-231072 --add-subgids 165536-231072 "$USER"
# in case of problems run as user: podman system migrate

# Allow serial communication for users (Platformio, Arduino)
sudo usermod -aG uucp,lock "$USER"

tldr --update
