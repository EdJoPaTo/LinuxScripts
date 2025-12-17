#!/usr/bin/env sh
set -eux

# copy stuff
sudo cp -rv system user /etc/systemd

# reload systemd
sudo systemctl daemon-reload
systemctl --user daemon-reload
