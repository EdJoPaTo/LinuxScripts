#!/bin/bash
set -e

# Console tools
brew install exa ffmpeg hugo zsh

# Image stuff
brew install imagemagick
brew cask install gimp inkscape

# Media
brew cask install iina vlc

# Data
brew install rsync
brew cask install resilio-sync

# Communication
brew cask install telegram telegram-desktop teamspeak-client mumble discord slack

# Development Tools
brew install bat cloc mtr nmap node
brew cask install atom visual-studio-code wireshark

# gpg stuff
brew install pinentry pinentry-mac

# Development Virtualisation
brew cask install docker virtualbox

# Development Boards
brew cask install etcher ftdi-vcp-driver silicon-labs-vcp-driver wch-ch34x-usb-serial-driver

# Small tools
brew cask install keepingyouawake quitter veracrypt

# Office
brew cask install mactex libreoffice
