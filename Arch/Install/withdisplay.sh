#!/usr/bin/sh
set -e

EXPLICIT=(
    arc-gtk-theme
    arduino
    dino
    gimp
    inkscape
    libreoffice-fresh
    mpv
    mumble
    remmina
    simple-scan
    steam
    teamspeak3
    telegram-desktop
    texlive-most
    torbrowser-launcher
    veracrypt
    virtualbox
    vlc
    wireshark-qt

    # Control displays via command line
    ddcutil

    # Audio
    mpd
    mpc
    paprefs
    pavucontrol

    # Preview in Filemanager
    totem
    ffmpegthumbnailer

    # Share mouse/keyboard with other computers
    barrier

    # Presentation Tool
    pdfpc

    # Terminal emulator
    alacritty

    # Browser
    chromium
    firefox
    firefox-dark-reader
    firefox-decentraleyes
    firefox-temporary-containers
    firefox-ublock-origin
    ## dont install firefox-umatrix: 1. not all users might want it; 2. it seems to forget its rules on each restart
    ## https://addons.mozilla.org/firefox/addon/single-file
    ## https://addons.mozilla.org/firefox/addon/umatrix

    # Editor
    code

    # Languages
    hunspell-de
    hunspell-en_GB
    hunspell-en_US
    hyphen-de
    hyphen-en
    mythes-de
    mythes-en

    # Printer
    cups
    cups-pdf

    # fonts
    ttf-dejavu
    ttf-opensans

    # emoji support (in terminal, notifications, ...)
    noto-fonts-emoji
)

DEPS=(
    arduino-avr-core
    pipewire
    pipewire-alsa
    pipewire-pulse
    trash-cli
    virtualbox-ext-vnc
    virtualbox-guest-iso
    virtualbox-host-dkms

    # inkscape optimized svg
    python-numpy
    python-lxml
    scour

    # Languages
    libmythes

    # remmina remote desktop
    freerdp
    libvncserver
)

sudo pacman -Sy

sudo pacman --noconfirm --needed -S --asdeps "${DEPS[@]}"
sudo pacman --noconfirm --needed -S "${EXPLICIT[@]}"

# Arduino
sudo usermod -aG uucp,lock "$USER"

# wireshark
sudo usermod -aG wireshark "$USER"
