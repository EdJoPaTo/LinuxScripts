#!/usr/bin/env bash
set -e

EXPLICIT=(
    gdm

    # gnome basis
    gnome-backgrounds
    gnome-keyring
    gnome-screenshot
    gnome-shell-extensions
    gnome-terminal

    # gnome tools
    eog
    evince
    gnome-weather
    gedit
    gnome-calculator
    gnome-mines
    gnome-tweaks
    gucharmap
    file-roller
    nautilus
    gnome-disk-utility
    gnome-power-manager

    # Disk Usage Analyzer
    baobab

    # Gnome extensions backend to be used from firefox or chrome for extensions.gnome.org
    chrome-gnome-shell
)

DEPS=(
    eog-plugins
    gnome-control-center
    system-config-printer

    # remote locations
    gvfs-afc
    gvfs-smb
    gvfs-gphoto2
    gvfs-mtp
    gvfs-goa
    gvfs-nfs
    gvfs-google

    # file-roller optionals
    lrzip
    p7zip
    squashfs-tools
    unace
    unrar
)

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}"
