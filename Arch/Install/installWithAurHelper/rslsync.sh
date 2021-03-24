#!/usr/bin/env bash
set -e

sudo pacman -Sy

./installWithAurHelper.sh rslsync

mkdir -p ~/.config/rslsync
mkdir -p ~/.cache/rslsync

cat > ~/.config/rslsync/rslsync.conf << EOF
{
    "device_name": "$HOSTNAME",
    "storage_path": "~/.cache/rslsync/",
    "webui": {
        "listen": "127.0.0.1:8888"
    }
}
EOF

systemctl --user enable rslsync.service
systemctl --user start rslsync.service
