#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

# gnome basis
sudo pacman $param adwaita-icon-theme gdm gnome-control-center gnome-screenshot gnome-shell-extensions gnome-terminal gnome-backgrounds

# gnome tools
sudo pacman $param eog evince gnome-calculator gnome-tweak-tool gedit gucharmap nautilus gnome-mines

# remote locations
sudo pacman $param --asdeps gvfs-afc gvfs-smb gvfs-gphoto2 gvfs-mtp gvfs-goa gvfs-nfs gvfs-google

# Gnome maps (contains evolution and zeitgeist)
# sudo pacman $param gnome-maps

# Gnome Keyring
sudo pacman $param gnome-keyring

# Disk Usage Analyzer
sudo pacman $param baobab

# Laptop
sudo pacman $param gnome-power-manager

# tools for ntfs, fat
sudo pacman $param gparted
sudo pacman $param --asdeps ntfs-3g dosfstools mtools gpart
sudo ln -s /usr/bin/ntfsfix /usr/sbin/fsck.ntfs
sudo ln -s /usr/bin/ntfsfix /usr/sbin/fsck.ntfs-3g

# user dirs
sudo pacman $param xdg-user-dirs

# gnome fileroller
sudo pacman $param file-roller
sudo pacman $param --asdeps p7zip unrar lrzip unace

../../Install/gnome3.sh
