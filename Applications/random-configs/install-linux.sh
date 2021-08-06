#!/usr/bin/env bash
set -e

function link() {
	mkdir -p "$(dirname "$2")"
	# verbose relative symbolic force
	ln -vrsf "$1" "$2"
}

link "$(pwd)/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
link "$(pwd)/dive.yaml" "$HOME/.config/dive/dive.yaml"
link "$(pwd)/git.ignore" "$HOME/.config/git/global.ignore"
link "$(pwd)/gitconfig" "$HOME/.gitconfig"
link "$(pwd)/htoprc" "$HOME/.config/htop/htoprc"
link "$(pwd)/paru.conf" "$HOME/.config/paru/paru.conf"
link "$(pwd)/tokeignore" "$HOME/.tokeignore"
link "$(pwd)/vscode-settings.json" "$HOME/.config/Code - OSS/User/settings.json"

mkdir -p "$HOME/.cache/mpd"
link "$(pwd)/mpd.conf" "$HOME/.config/mpd/mpd.conf"
