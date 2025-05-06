#!/usr/bin/env bash
set -eu -o pipefail

# List installed: flatpak list --app

EXPLICIT=(
	com.github.tenderowl.frog
	com.mattjakeman.ExtensionManager
	in.varb.Ausweiskopie
	io.github.diegoivan.pdf_metadata_editor
	io.gitlab.adhami3310.Footage
	org.gnome.Fractal
	org.raspberrypi.rpi-imager
	# org.jitsi.jitsi-meet
	# org.signal.Signal
	# org.telegram.desktop
)

flatpak install "${EXPLICIT[@]}"

flatpak uninstall --unused
