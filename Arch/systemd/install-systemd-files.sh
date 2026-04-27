#!/usr/bin/env sh
set -eux

sudo install -Dm644 user/* -t /usr/local/lib/systemd/user/

# reload systemd
sudo systemctl daemon-reload
systemctl --user daemon-reload
