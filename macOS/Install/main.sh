#!/usr/bin/env bash
set -eu

CASKS=(
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
	raspberry-pi-imager
	signal
	syncthing
	teamspeak-client
	telegram
	telegram-desktop
	vscodium
)

FORMULAS=(
	ansible
	ansible-lint
	bat
	cargo-audit
	cargo-nextest
	deno
	dive
	dust
	exa
	fd
	ffmpeg
	fzf
	gnuplot
	htop
	hugo
	hyperfine
	imagemagick
	jq
	languagetool
	moreutils
	mpc
	mpd
	neovim
	nmap
	node
	nvm
	oxipng
	platformio
	podman
	ripgrep
	rsync
	rust-analyzer
	rustup-init
	shellcheck
	starship
	tokei
	yq
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
brew upgrade --greedy --no-quarantine

brew install --no-quarantine "${FORMULAS[@]}"
brew install --cask --no-quarantine "${CASKS[@]}"
