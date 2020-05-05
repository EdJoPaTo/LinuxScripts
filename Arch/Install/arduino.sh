#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param arduino
sudo pacman $param --asdeps arduino-avr-core

sudo gpasswd -a $USER uucp
sudo gpasswd -a $USER lock

echo logout required!

# see https://wiki.archlinux.org/index.php/Arduino
