#!/usr/bin/env bash
set -e

function link() {
	mkdir -p "$(dirname "$2")"
	# verbose symbolic force
	ln -vsf "$1" "$2"
}

link "$(pwd)/dive.yaml" "$HOME/.config/dive/dive.yaml"
link "$(pwd)/git.ignore" "$HOME/.config/git/global.ignore"
link "$(pwd)/gitconfig" "$HOME/.gitconfig"
link "$(pwd)/htoprc" "$HOME/.config/htop/htoprc"
link "$(pwd)/vscode-settings.json" "$HOME/Library/Application Support/VSCodium/User/settings.json"
