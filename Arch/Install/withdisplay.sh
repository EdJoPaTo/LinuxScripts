#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

# Control displays via command line
sudo pacman $param ddcutil

# Audio
sudo pacman $param mpd mpc

# Video
sudo pacman $param vlc mpv

# Picture Tools
sudo pacman $param gimp inkscape
## save optimized svg
sudo pacman $param --asdeps python-numpy python-lxml scour

# Preview in Filemanager
sudo pacman $param totem ffmpegthumbnailer

# Presentation Tool
sudo pacman $param pdfpc

# Terminal emulator
sudo pacman $param alacritty

# Communication
sudo pacman $param teamspeak3 mumble telegram-desktop dino

# Browser
sudo pacman $param chromium
sudo pacman $param firefox firefox-ublock-origin firefox-decentraleyes
## dont install firefox-umatrix: 1. not all users might want it; 2. it seems to forget its rules on each restart

# Editor
sudo pacman $param code
sudo pacman $param --asdeps trash-cli

# Arduino
sudo pacman $param arduino
sudo pacman $param --asdeps arduino-avr-core
sudo usermod -aG uucp,lock "$USER"

# Scanner tools
sudo pacman $param simple-scan

# Printer
sudo pacman $param cups cups-pdf

# LibreOffice
sudo pacman $param libreoffice-fresh

# Languages
sudo pacman $param hyphen-de hyphen-en hunspell-de hunspell-en_GB hunspell-en_US mythes-de mythes-en
sudo pacman $param --asdeps libmythes

# wireshark
sudo pacman $param wireshark-qt
sudo usermod -aG wireshark "$USER"

# hex editor
sudo pacman $param ghex

# remmina remote desktop
sudo pacman $param remmina
sudo pacman $param --asdeps freerdp libvncserver

# virtualisation
sudo pacman $param --asdeps virtualbox-host-dkms virtualbox-guest-iso virtualbox-ext-vnc
sudo pacman $param virtualbox

# fonts
sudo pacman $param ttf-dejavu ttf-opensans

# emoji support (in terminal, notifications, ...)
sudo pacman $param noto-fonts-emoji
