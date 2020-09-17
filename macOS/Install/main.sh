#!/bin/sh
set -e

# Console tools
brew install exa ffmpeg hugo the_silver_searcher

# zsh plugins
brew install zsh zsh-history-substring-search zsh-syntax-highlighting romkatv/powerlevel10k/powerlevel10k

# Ansible
brew install ansible ansible-lint

# Image stuff
brew install imagemagick gnuplot
brew cask install gimp inkscape

# Media
brew cask install iina vlc

# Browser
brew cask install firefox chromium google-chrome

# Data
brew install rsync
brew cask install resilio-sync

# Communication
brew cask install telegram telegram-desktop teamspeak-client mumble

# Development Tools
brew install bat cloc mtr nmap node
brew cask install atom visual-studio-code wireshark

# gpg stuff
brew install pinentry pinentry-mac

# Development Virtualisation
brew cask install docker virtualbox

# Development Boards
brew cask install balenaetcher arduino mqtt-explorer

# Small tools
brew cask install keepingyouawake quitter veracrypt

# Office
brew cask install mactex libreoffice
