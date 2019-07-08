#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

# VLC
sudo pacman $param vlc

# Picture Tools
sudo pacman $param gimp inkscape
## save optimized svg
sudo pacman $param --asdeps python2-lxml python2-scour

# Presentation Tool
sudo pacman $param pdfpc

# Teamspeak
sudo pacman $param teamspeak3 mumble

# Chat
sudo pacman $param telegram-desktop

# Browser
sudo pacman $param chromium firefox

# LibreOffice
sudo pacman $param libreoffice-fresh libreoffice-extension-texmaths

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
