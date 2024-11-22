#!/usr/bin/env bash
set -eu -o pipefail

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

# Git folders
mkdir -p ~/git/hub/EdJoPaTo/public

for file in bin/*; do
	chmod +x "$file"
	filename=$(basename "$file")
	link "$file" "$HOME/bin/$filename"
done

for file in completions/*; do
	filename=$(basename "$file")
	link "$file" "$HOME/.config/completions/$filename"
done

# Music Player Daemon
mkdir -p "$HOME/.cache/mpd/"
link "mpd.conf" "$HOME/.config/mpd/mpd.conf"

# Zsh
mkdir -p "$HOME/.cache/"
link "zsh/zshrc" "$HOME/.zshrc"
for file in zsh/*.zsh; do
	filename=$(basename "$file")
	link "$file" "$HOME/.config/zsh/$filename"
done

# Linux only
if [[ $OSTYPE = linux* ]]; then
	link "fuzzel.ini" "$HOME/.config/fuzzel/fuzzel.ini"
	link "hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
	link "i3status-rust.toml" "$HOME/.config/i3status-rust/config.toml"
	link "kanshi" "$HOME/.config/kanshi/config"
	link "niri.kdl" "$HOME/.config/niri/config.kdl"
	link "paru.conf" "$HOME/.config/paru/paru.conf"
	link "sway" "$HOME/.config/sway/config"
	link "swaylock" "$HOME/.config/swaylock/config"
	link "waybar" "$HOME/.config/waybar"
fi

link ".editorconfig" "$HOME/.editorconfig"
link ".tokeignore" "$HOME/.tokeignore"
link "alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
link "aliases" "$HOME/.config/aliases"
link "config.fish" "$HOME/.config/fish/config.fish"
link "dive.yaml" "$HOME/.config/dive/dive.yaml"
link "env" "$HOME/.config/env"
link "gitconfig" "$HOME/.config/git/config"
link "global.gitignore" "$HOME/.config/git/ignore"
link "helix" "$HOME/.config/helix"
link "htoprc" "$HOME/.config/htop/htoprc"
link "neovim-init.lua" "$HOME/.config/nvim/init.lua"
link "ripgreprc" "$HOME/.config/ripgreprc"
link "starship.toml" "$HOME/.config/starship.toml"
link "tmux.conf" "$HOME/.config/tmux/tmux.conf"
link "zed-settings.jsonc" "$HOME/.config/zed/settings.json"

rm -f "$HOME/.gitconfig"

if [[ $OSTYPE = darwin* ]]; then
	link "vscode-settings.json" "$HOME/Library/Application Support/VSCodium/User/settings.json"
else
	link "vscode-settings.json" "$HOME/.config/Code - OSS/User/settings.json"
fi
