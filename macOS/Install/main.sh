#!/usr/bin/env bash
set -e

PACKAGES=(
    ansible
    ansible-lint
    arduino
    balenaetcher
    bat
    cargo-audit
    cargo-edit
    cargo-watch
    chromium
    dive
    docker
    exa
    fd
    ffmpeg
    firefox
    gimp
    gnuplot
    google-chrome
    hugo
    hyperfine
    iina
    imagemagick
    inkscape
    keepingyouawake
    libreoffice
    mactex
    mqtt-explorer
    mtr
    mumble
    nmap
    node
    oxipng
    quitter
    resilio-sync
    ripgrep
    rsync
    rustup-init
    starship
    teamspeak-client
    telegram
    telegram-desktop
    tokei
    veracrypt
    virtualbox
    visual-studio-code
    vlc
    wireshark
    youtube-dl
    zsh
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting

    # gpg stuff
    pinentry
    pinentry-mac
)

# Ensure everything is up to date or else brew fails (which is dumb as same version is a warning)
brew update
brew upgrade --greedy

brew install "${PACKAGES[@]}"

../../Install/rust.sh
