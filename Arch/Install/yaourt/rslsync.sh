#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param rslsync

mkdir -p ~/.config/rslsync
rslsync --dump-sample-config > ~/.config/rslsync/rslsync.conf

nano ~/.config/rslsync/rslsync.conf

systemctl --user enable rslsync.service
systemctl --user start rslsync.service

