#!/usr/bin/env bash
set -e

# copy stuff
sudo cp -ruv system user /etc/systemd

# reload systemd
sudo systemctl daemon-reload
systemctl --user daemon-reload
