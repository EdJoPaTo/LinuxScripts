#!/usr/bin/env bash
set -e

CASKS=(
	arduino
	balenaetcher
	docker
	element
	firefox
	gimp
	iina
	inkscape
	keepingyouawake
	libreoffice
	mactex
	mumble
	quitter
	resilio-sync
	syncthing
	teamspeak-client
	telegram
	telegram-desktop
	veracrypt
	virtualbox
	vlc
	vscodium
	wireshark
)

FORMULAS=(
	ansible
	ansible-lint
	bat
	cargo-audit
	cargo-edit
	cargo-watch
	deno
	dive
	dust
	exa
	fd
	ffmpeg
	gnuplot
	hugo
	hyperfine
	imagemagick
	languagetool
	mtr
	neovim
	nmap
	node
	oxipng
	podman
	ripgrep
	rsync
	rust-analyzer
	rustup-init
	shellcheck
	starship
	tokei
	yt-dlp
	zsh
	zsh-completions
	zsh-history-substring-search
	zsh-syntax-highlighting

	# gpg stuff
	pinentry
	pinentry-mac
)

# Ensure everything is up to date or else brew fails (which is dumb as same version is a warning)
brew update
brew upgrade --greedy

brew install "${FORMULAS[@]}"
brew install --cask "${CASKS[@]}"
