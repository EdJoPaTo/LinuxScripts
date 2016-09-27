#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param btsync

mkdir -p ~/.config/btsync
btsync --dump-sample-config > ~/.config/btsync/btsync.conf

nano ~/.config/btsync/btsync.conf

systemctl --user enable btsync.service
systemctl --user start btsync.service

