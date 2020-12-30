#!/usr/bin/sh
set -e

./installWithAurHelper.sh nautilus-open-any-terminal

gsettings set com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
