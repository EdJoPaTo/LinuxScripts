#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

# GUI Tools
sudo pacman $param vlc qt4

# Picture Tools
sudo pacman $param gimp inkscape

# Presentation Tool
sudo pacman $param pdfpc

# Teamspeak
sudo pacman $param teamspeak3

# Browser
sudo pacman $param chromium firefox

# LibreOffice
sudo pacman $param libreoffice-fresh libreoffice-extension-texmaths

# Languages
sudo pacman $param hyphen hyphen-de hyphen-en hunspell hunspell-de hunspell-en libmythes mythes-de mythes-en

# wireshark
sudo pacman $param wireshark-gtk
sudo usermod -aG wireshark "$USER"
