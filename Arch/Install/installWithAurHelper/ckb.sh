#!/usr/bin/sh
set -e

sudo pacman -Sy

./installWithAurHelper.sh ckb-next-git

sudo systemctl enable ckb-next-daemon
sudo systemctl start ckb-next-daemon
