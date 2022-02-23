#!/usr/bin/env bash
set -e

EXPLICIT=(
	esphome
	nvm
	platformio
	rslsync
	tootle
	ttf-ms-fonts
)

DEPS=(
)

./installWithAurHelper.sh "${DEPS[@]}" "${EXPLICIT[@]}"
sudo pacman -D --asexplicit --quiet "${EXPLICIT[@]}"

mkdir -p ~/.config/rslsync
mkdir -p ~/.cache/rslsync

cat > ~/.config/rslsync/rslsync.conf << EOF
{
	"device_name": "$HOSTNAME",
	"storage_path": "$HOME/.cache/rslsync/",
	"webui": {
		"listen": "127.0.0.1:8888"
	}
}
EOF
