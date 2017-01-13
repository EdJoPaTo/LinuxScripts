#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

# gnome basis
sudo pacman $param adwaita-icon-theme gdm gnome-control-center gnome-screenshot gnome-shell-extensions gnome-terminal gnome-backgrounds

# gnome tools
sudo pacman $param eog evince gnome-calculator gnome-tweak-tool gedit gucharmap nautilus gnome-mines

# Gnome maps (contains evolution and zeitgeist)
# sudo pacman $param gnome-maps

# Disk Usage Analyzer
sudo pacman $param baobab

# Laptop
sudo pacman $param gnome-power-manager

# tools for ntfs, fat
sudo pacman $param gparted
sudo pacman $param --asdeps ntfs-3g dosfstools mtools
sudo ln -s /usr/bin/ntfsfix /usr/sbin/fsck.ntfs
sudo ln -s /usr/bin/ntfsfix /usr/sbin/fsck.ntfs-3g

# user dirs
sudo pacman $param xdg-user-dirs

# gnome fileroller
sudo pacman $param file-roller
sudo pacman $param --asdeps p7zip unrar lrzip unace

../../Install/gnome3.sh
