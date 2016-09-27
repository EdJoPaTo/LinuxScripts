#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

# openbox
sudo pacman $param openbox obconf
