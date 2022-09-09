#!/usr/bin/env bash
set -eu

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

# Neovim
link "$(pwd)/neovim/init.lua" "$HOME/.config/nvim/init.lua"
rm -f "$HOME/.config/nvim/lua"
link "$(pwd)/neovim/lua" "$HOME/.config/nvim/lua"

# Zsh
mkdir -p "$HOME/.cache/"
link "$(pwd)/zsh/zshrc" "$HOME/.zshrc"
for file in "$(pwd)"/zsh/*.zsh; do
	filename=$(basename "$file")
	link "$file" "$HOME/.config/zsh/$filename"
done

link "$(pwd)/.editorconfig" "$HOME/.editorconfig"
link "$(pwd)/.tokeignore" "$HOME/.tokeignore"
link "$(pwd)/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
link "$(pwd)/dive.yaml" "$HOME/.config/dive/dive.yaml"
link "$(pwd)/gitconfig" "$HOME/.config/git/config"
link "$(pwd)/global.gitignore" "$HOME/.config/git/global.gitignore"
link "$(pwd)/helix" "$HOME/.config/helix"
link "$(pwd)/htoprc" "$HOME/.config/htop/htoprc"
link "$(pwd)/paru.conf" "$HOME/.config/paru/paru.conf"
link "$(pwd)/tmux.conf" "$HOME/.config/tmux/tmux.conf"

rm "$HOME/.gitconfig"

if [[ $OSTYPE = darwin* ]]; then
	link "$(pwd)/vscode-settings.json" "$HOME/Library/Application Support/VSCodium/User/settings.json"
else
	link "$(pwd)/vscode-settings.json" "$HOME/.config/Code - OSS/User/settings.json"
fi
