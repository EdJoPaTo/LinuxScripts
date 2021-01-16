#!/usr/bin/sh
set -e

EXPLICIT=(
    insomnia-bin
    mqtt-explorer-appimage
    obs-studio # in repos but kinda useless without v4l2sink
    obs-v4l2sink
    platformio
    ttf-ms-fonts

    # music
    mp3diags-unstable
    mpd-mpris

    # create bootables
    etcher-bin
    popsicle
    ventoy-bin

    # uff communication
    slack-desktop
    teams
    zoom
)

DEPS=(
    # obs
    v4l2loopback-dkms

    # Zoom optional dependencies - not sure if really needed
    picom
    xcompmgr
)

sudo pacman -Sy

./installWithAurHelper.sh --asdeps "${DEPS[@]}"
./installWithAurHelper.sh "${EXPLICIT[@]}"
