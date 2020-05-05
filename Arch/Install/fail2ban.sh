#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param fail2ban

sudo systemctl enable fail2ban.service
sudo systemctl start fail2ban.service
