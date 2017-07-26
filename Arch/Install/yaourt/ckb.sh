#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param ckb-next

sudo systemctl enable ckb-daemon
sudo systemctl start ckb-daemon

