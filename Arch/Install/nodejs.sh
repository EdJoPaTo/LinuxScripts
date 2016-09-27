#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param nodejs npm

../../Install/npmGlobals.sh

