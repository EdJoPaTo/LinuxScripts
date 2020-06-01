#!/usr/bin/sh
set -e

./installWithAurHelper.sh ckb-next-git

sudo systemctl enable ckb-next-daemon
sudo systemctl start ckb-next-daemon
