#!/usr/bin/env bash
set -eux -o pipefail

sudo install --owner=gdm --group=gdm --mode=644 --preserve-timestamps ~/.config/monitors.xml ~gdm/.config/
