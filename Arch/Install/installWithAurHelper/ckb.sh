#!/bin/bash

./installWithAurHelper.sh ckb-next

sudo systemctl enable ckb-daemon
sudo systemctl start ckb-daemon
