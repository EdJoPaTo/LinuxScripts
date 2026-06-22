#!/usr/bin/env bash
set -eu -o pipefail

# List installed: flatpak list --app

EXPLICIT=(
	com.cassidyjames.butler
	com.mattjakeman.ExtensionManager
	io.github.diegoivan.pdf_metadata_editor
	io.gitlab.adhami3310.Footage
	org.gnome.Fractal
	# org.jitsi.jitsi-meet
	# org.signal.Signal
	# org.telegram.desktop
)

flatpak install "${EXPLICIT[@]}"

flatpak uninstall --unused
