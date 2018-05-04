#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

sudo pacman $param telegram-desktop
