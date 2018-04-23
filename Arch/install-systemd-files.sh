#!/bin/bash

# copy stuff
sudo cp -uv systemd/* /etc/systemd/system

# reload systemd
sudo systemctl daemon-reload
