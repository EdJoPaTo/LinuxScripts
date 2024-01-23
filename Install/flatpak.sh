#!/usr/bin/env bash
set -eu

EXPLICIT=(
	com.mattjakeman.ExtensionManager
	io.gitlab.adhami3310.Footage
	org.gnome.Fractal
	org.jitsi.jitsi-meet
	org.raspberrypi.rpi-imager
	# org.signal.Signal
	# org.telegram.desktop
)

flatpak install "${EXPLICIT[@]}"
