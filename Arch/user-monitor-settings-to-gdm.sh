#!/usr/bin/env sh
set -eux

sudo install --owner=gdm --group=gdm --mode=644 --preserve-timestamps ~/.config/monitors.xml ~gdm/.config/
