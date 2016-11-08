#!/bin/bash
sudo pacman -Sy
param="--noconfirm --needed -S"

# atom-beautify dependency for c++
sudo pacman $param clang

sudo pacman $param atom

../../Install/Atom.sh
