#!/usr/bin/env bash
set -eu

gset() {
	echo "## $1 $2"
	gsettings get "$1" "$2"
	echo "$3"
	gsettings set "$1" "$2" "$3"
}

gset com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
gset org.gnome.Console theme auto
gset org.gnome.desktop.calendar show-weekdate true
gset org.gnome.desktop.interface clock-show-date true
gset org.gnome.desktop.notifications show-banners false
gset org.gnome.desktop.notifications show-in-lock-screen false
gset org.gnome.desktop.peripherals.mouse natural-scroll true
gset org.gnome.desktop.privacy old-files-age 14
gset org.gnome.desktop.privacy remember-recent-files false
gset org.gnome.desktop.privacy remove-old-temp-files true
gset org.gnome.desktop.privacy remove-old-trash-files true
gset org.gnome.mutter workspaces-only-on-primary false
gset org.gnome.settings-daemon.plugins.color night-light-enabled true
gset org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gset org.gnome.settings-daemon.plugins.media-keys www "['<Super>b']"
gset org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type nothing
gset org.gnome.shell.extensions.caffeine inhibit-apps "['mpv.desktop']"
gset org.gnome.shell.extensions.caffeine show-notifications false

EXTENSIONS=(
	blur-my-shell@aunetx
	caffeine@patapon.info
	system-monitor-next@paradoxxx.zero.gmail.com
)

for extension in "${EXTENSIONS[@]}"; do
	gnome-extensions enable "$extension"
done
