#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

sudo pacman $param arc-gtk-theme arc-icon-theme 

