#!/usr/bin/sh
set -e

./installWithAurHelper.sh rslsync

mkdir -p ~/.config/rslsync
rslsync --dump-sample-config > ~/.config/rslsync/rslsync.conf

nano ~/.config/rslsync/rslsync.conf

systemctl --user enable rslsync.service
systemctl --user start rslsync.service
