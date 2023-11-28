#!/usr/bin/env bash
set -eu

function link() {
	mkdir -p "$(dirname "$2")"
	rm -rf "$2"
	if [[ $OSTYPE = darwin* ]]; then
		# verbose symbolic force
		ln -vsf "$(realpath "$1")" "$2"
	else
		ln --verbose --relative --symbolic --force "$1" "$2"
	fi
}

# Bin files
for file in bin/*; do
	filename=$(basename "$file")
	link "$file" "$HOME/bin/$filename"
done

# Git folders
mkdir -p ~/git/hub/EdJoPaTo/public

# Music Player Daemon
mkdir -p "$HOME/.cache/mpd/"
link "mpd.conf" "$HOME/.config/mpd/mpd.conf"

# Neovim
link "neovim/init.lua" "$HOME/.config/nvim/init.lua"
link "neovim/lua" "$HOME/.config/nvim/lua"

# Linux only
if [[ $OSTYPE = linux* ]]; then
	link "envvars.conf" "$HOME/.config/environment.d/envvars.conf"
	link "fuzzel.ini" "$HOME/.config/fuzzel/fuzzel.ini"
	link "hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
	link "i3status-rust.toml" "$HOME/.config/i3status-rust/config.toml"
	link "kanshi" "$HOME/.config/kanshi/config"
	link "paru.conf" "$HOME/.config/paru/paru.conf"
	link "rofi" "$HOME/.config/rofi"
	link "sway" "$HOME/.config/sway/config"
	link "swaylock" "$HOME/.config/swaylock/config"
	link "waybar" "$HOME/.config/waybar"
fi

# Zsh
mkdir -p "$HOME/.cache/"
mkdir -p "$HOME/.config/completions/"
link "zsh/zshrc" "$HOME/.zshrc"
for file in zsh/*.zsh; do
	filename=$(basename "$file")
	link "$file" "$HOME/.config/zsh/$filename"
done

link ".editorconfig" "$HOME/.editorconfig"
link ".tokeignore" "$HOME/.tokeignore"
link "alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
link "aliases" "$HOME/.config/aliases"
link "config.fish" "$HOME/.config/fish/config.fish"
link "dive.yaml" "$HOME/.config/dive/dive.yaml"
link "env" "$HOME/.config/env"
link "gitconfig" "$HOME/.config/git/config"
link "global.gitignore" "$HOME/.config/git/global.gitignore"
link "helix" "$HOME/.config/helix"
link "htoprc" "$HOME/.config/htop/htoprc"
link "starship.toml" "$HOME/.config/starship.toml"
link "tmux.conf" "$HOME/.config/tmux/tmux.conf"

rm -f "$HOME/.gitconfig"

if [[ $OSTYPE = darwin* ]]; then
	link "vscode-settings.json" "$HOME/Library/Application Support/VSCodium/User/settings.json"
else
	link "vscode-settings.json" "$HOME/.config/Code - OSS/User/settings.json"
fi
