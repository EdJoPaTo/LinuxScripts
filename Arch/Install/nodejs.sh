#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param nodejs
sudo pacman $param --asdeps npm

../../Install/npmGlobals.sh
