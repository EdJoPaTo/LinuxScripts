#!/usr/bin/sh

# copy stuff
sudo cp -uv *.service *.timer /etc/systemd/system

# reload systemd
sudo systemctl daemon-reload
