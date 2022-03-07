#!/usr/bin/env bash
set -e

function link() {
	mkdir -p "$(dirname "$2")"
	if [[ $OSTYPE = darwin* ]]; then
		# verbose symbolic force
		ln -vsf "$1" "$2"
	else
		ln --verbose --relative --symbolic --force "$1" "$2"
	fi
}

# Bin files
for file in "$(pwd)"/bin/*; do
	filename=$(basename "$file")
	link "$file" "$HOME/bin/$filename"
done

# Git folders
mkdir -p ~/git/aur
mkdir -p ~/git/gist
mkdir -p ~/git/haw
mkdir -p ~/git/hub/EdJoPaTo/public
mkdir -p ~/git/other

# Music Player Daemon
mkdir -p "$HOME/.cache/mpd/"
link "$(pwd)/mpd.conf" "$HOME/.config/mpd/mpd.conf"

# Zsh
mkdir -p "$HOME/.cache/"
link "$(pwd)/zsh/zshrc" "$HOME/.zshrc"
for file in "$(pwd)"/zsh/*.zsh; do
	filename=$(basename "$file")
	link "$file" "$HOME/.config/zsh/$filename"
done

link "$(pwd)/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
link "$(pwd)/dive.yaml" "$HOME/.config/dive/dive.yaml"
link "$(pwd)/git.ignore" "$HOME/.config/git/global.ignore"
link "$(pwd)/gitconfig" "$HOME/.gitconfig"
link "$(pwd)/htoprc" "$HOME/.config/htop/htoprc"
link "$(pwd)/neovim.lua" "$HOME/.config/nvim/init.lua"
link "$(pwd)/paru.conf" "$HOME/.config/paru/paru.conf"
link "$(pwd)/tokeignore" "$HOME/.tokeignore"

if [[ $OSTYPE = darwin* ]]; then
	link "$(pwd)/vscode-settings.json" "$HOME/Library/Application Support/VSCodium/User/settings.json"
else
	link "$(pwd)/vscode-settings.json" "$HOME/.config/Code - OSS/User/settings.json"
fi
