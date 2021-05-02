#!/usr/bin/env bash
set -e

EXPLICIT=(
    alacritty
    arc-gtk-theme
    arduino
    code
    ddcutil
    dino
    element-desktop # test fractal when SSO works https://gitlab.gnome.org/GNOME/fractal/-/issues/521
    gimp
    inkscape
    languagetool
    libreoffice-fresh
    mpv
    mumble
    pdfpc
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
    xfmpc

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

    # Browser
    chromium
    firefox
    firefox-clearurls
    firefox-dark-reader
    firefox-decentraleyes
    firefox-extension-privacybadger
    firefox-temporary-containers
    firefox-ublock-origin
    ## https://addons.mozilla.org/firefox/addon/privacy-redirect/
    ## https://addons.mozilla.org/firefox/addon/single-file
    ## https://addons.mozilla.org/firefox/addon/svg-screenshots/
    ## https://addons.mozilla.org/firefox/addon/umatrix

    # Languages
    hunspell-de
    hunspell-en_gb
    hunspell-en_us
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
