#!/usr/bin/env bash
set -e

CASKS=(
    arduino
    balenaetcher
    chromium
    docker
    element
    firefox
    gimp
    google-chrome
    iina
    inkscape
    keepingyouawake
    libreoffice
    mactex
    mqtt-explorer
    mumble
    quitter
    resilio-sync
    syncthing
    teamspeak-client
    telegram
    telegram-desktop
    veracrypt
    virtualbox
    vlc
    vscodium
    wireshark
)

FORMULAS=(
    ansible
    ansible-lint
    bat
    cargo-audit
    cargo-edit
    cargo-watch
    deno
    dive
    exa
    fd
    ffmpeg
    gnuplot
    hugo
    hyperfine
    imagemagick
    languagetool
    mtr
    nmap
    node
    oxipng
    podman
    ripgrep
    rsync
    rustup-init
    shellcheck
    starship
    tokei
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

brew install "${FORMULAS[@]}"
brew install --cask "${CASKS[@]}"
