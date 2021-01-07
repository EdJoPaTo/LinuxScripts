#!/bin/sh
set -e

# Ensure everything is up to date or else brew fails (which is dumb as same version is a warning)
brew update
brew upgrade --greedy

# Console tools
brew install exa hugo ripgrep fd hyperfine

# zsh plugins
brew install zsh zsh-history-substring-search zsh-syntax-highlighting starship

# Ansible
brew install ansible ansible-lint

# Image stuff
brew install imagemagick gnuplot oxipng
brew cask install gimp inkscape

# Media stuff
brew install ffmpeg youtube-dl

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
brew install bat tokei mtr nmap node
brew cask install atom visual-studio-code wireshark

# Rust
brew install rustup-init cargo-audit cargo-edit cargo-watch
../../Install/rust.sh

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
