#!/usr/bin/sh

# copy stuff
sudo cp -ruv system user /etc/systemd

# reload systemd
sudo systemctl daemon-reload
systemctl --user daemon-reload
