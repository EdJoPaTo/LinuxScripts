#!/usr/bin/env bash
set -e

# copy stuff
sudo cp -rv system user /etc/systemd

# reload systemd
sudo systemctl daemon-reload
systemctl --user daemon-reload
