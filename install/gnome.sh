#!/usr/bin/env bash
set -eu -o pipefail

# gsettings is dconf + schemas, so prefer gsettings over dconf
# useful for finding keys:
# gsettings list-recursively | rg banana
# dconf watch /

gset() {
	echo "## $1 $2"
	gsettings get "$1" "$2"
	echo "$3"
	gsettings set "$1" "$2" "$3"
}

dset() {
  echo "## $1"
	dconf read "$1"
	echo "$2"
	dconf write "$1" "$2"
}

gset com.github.stunkymonkey.nautilus-open-any-terminal terminal alacritty
gset org.gnome.Console theme auto
gset org.gnome.desktop.calendar show-weekdate true
gset org.gnome.desktop.interface accent-color orange
gset org.gnome.desktop.interface clock-show-date true
gset org.gnome.desktop.interface clock-show-weekday true
gset org.gnome.desktop.notifications show-in-lock-screen false
gset org.gnome.desktop.peripherals.mouse natural-scroll true
gset org.gnome.desktop.privacy old-files-age 14
gset org.gnome.desktop.privacy remember-recent-files false
gset org.gnome.desktop.privacy remove-old-temp-files true
gset org.gnome.desktop.privacy remove-old-trash-files true
gset org.gnome.mutter workspaces-only-on-primary false
gset org.gnome.settings-daemon.plugins.color night-light-enabled true
gset org.gnome.settings-daemon.plugins.color night-light-schedule-automatic true
gset org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gset org.gnome.settings-daemon.plugins.media-keys www "['<Super>b']"
gset org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type nothing
gset org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'Alacritty.desktop']"
gset org.gnome.shell.extensions.blur-my-shell.panel override-background-dynamically true
gset org.gnome.shell.extensions.caffeine show-notifications false
gset org.gnome.system.locale region 'de_DE.UTF-8'
gset org.gnome.system.location enabled true

dset /org/gnome/shell/extensions/system-monitor-next-applet/custom-monitor-command "'alacritty --command htop'"
dset /org/gnome/shell/extensions/system-monitor-next-applet/graph-cooldown-delay-m 5
dset /org/gnome/shell/extensions/system-monitor-next-applet/icon-display false
dset /org/gnome/shell/extensions/system-monitor-next-applet/memory-cache-color "'#00ff0020'"
dset /org/gnome/shell/extensions/system-monitor-next-applet/rotate-labels true

EXTENSIONS=(
	blur-my-shell@aunetx
	caffeine@patapon.info
	system-monitor-next@paradoxxx.zero.gmail.com
)

for extension in "${EXTENSIONS[@]}"; do
	gnome-extensions enable "$extension"
done
