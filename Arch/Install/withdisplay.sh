#!/usr/bin/env bash
set -e

EXPLICIT_GROUPS=(
	texlive-most
)

EXPLICIT=(
	alacritty
	arduino
	cmatrix
	ddcutil
	dino
	flatpak
	fractal
	gimp
	gnuradio-companion
	gnuradio-osmosdr
	inkscape
	libreoffice-fresh
	mpv
	mumble
	newsflash
	pdfpc
	remmina
	telegram-desktop
	tiled
	vlc
	wireshark-qt
	xfmpc

	# Audio
	kid3-qt
	mpc
	mpd
	pavucontrol

	# Preview in Filemanager
	totem
	ffmpegthumbnailer

	# Browser
	firefox
	firefox-clearurls
	firefox-dark-reader
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
	languagetool
	mythes-de
	mythes-en

	# fonts
	noto-fonts-emoji # emoji support (in terminal, notifications, ...)
	ttf-dejavu
	ttf-opensans

	# casual games
	gnome-mines
	gnome-sudoku
)

DEPS=(
	arduino-avr-core
	trash-cli

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

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}" "${EXPLICIT_GROUPS[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}" $(pacman -Qgq "${EXPLICIT_GROUPS[@]}")

# Arduino
usermod -aG uucp,lock "$(logname)"

# communicate with monitors via ddc (ddcutil)
echo "i2c-dev" > /etc/modules-load.d/ddc.conf

# wireshark
usermod -aG wireshark "$(logname)"
