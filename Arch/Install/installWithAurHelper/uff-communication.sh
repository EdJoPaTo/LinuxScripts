#!/usr/bin/sh
set -e

./installWithAurHelper.sh slack-desktop teams zoom

# Zoom optional dependencies - not sure if really needed
./installWithAurHelper.sh --asdeps picom xcompmgr
