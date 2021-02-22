#!/bin/sh
set -e

# Ensure everything is up to date or else brew fails (which is dumb as same version is a warning)
brew update
brew upgrade --greedy

# Console tools
brew install exa hugo ripgrep fd hyperfine

# zsh plugins
brew install zsh zsh-completions zsh-history-substring-search zsh-syntax-highlighting starship

# Ansible
brew install ansible ansible-lint

# Image stuff
brew install imagemagick gnuplot oxipng
brew install --cask gimp inkscape

# Media stuff
brew install ffmpeg youtube-dl

# Media
brew install --cask iina vlc

# Browser
brew install --cask firefox chromium google-chrome

# Data
brew install rsync
brew install --cask resilio-sync

# Communication
brew install --cask telegram telegram-desktop teamspeak-client mumble

# Development Tools
brew install bat tokei mtr nmap node
brew install --cask visual-studio-code wireshark

# Rust
brew install rustup-init cargo-audit cargo-edit cargo-watch
../../Install/rust.sh

# gpg stuff
brew install pinentry pinentry-mac

# Development Virtualisation
brew install --cask docker virtualbox

# Development Boards
brew install --cask balenaetcher arduino mqtt-explorer

# Small tools
brew install --cask keepingyouawake quitter veracrypt

# Office
brew install --cask mactex libreoffice
