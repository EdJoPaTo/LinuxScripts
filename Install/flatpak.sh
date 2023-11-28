#!/usr/bin/env bash
set -eu

EXPLICIT=(
	org.gnome.Fractal
	com.mattjakeman.ExtensionManager
	io.gitlab.adhami3310.Footage
	org.jitsi.jitsi-meet
	org.raspberrypi.rpi-imager
	# org.signal.Signal
	# org.telegram.desktop
)

flatpak install "${EXPLICIT[@]}"
