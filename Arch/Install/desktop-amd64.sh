#!/usr/bin/env bash
set -e

EXPLICIT=(
	code
	element-desktop # test fractal when SSO works https://gitlab.gnome.org/GNOME/fractal/-/issues/521
	obs-studio
	steam
	teamspeak3
	veracrypt
	virtualbox
)

DEPS=(
	v4l2loopback-dkms # obs virtual cam
	virtualbox-ext-vnc
	virtualbox-guest-iso
	virtualbox-host-dkms
)

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}"

# load v4l2loopback
echo "v4l2loopback" > /etc/modules-load.d/v4l2.conf
