#!/usr/bin/env bash
set -eu -o pipefail

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
	vscodium
	zed
)

FORMULAS=(
	ansible
	ansible-lint
	bat
	cargo-audit
	cargo-msrv
	d2
	deno
	difftastic
	dive
	dog
	dust
	eza
	fd
	ffmpeg
	fish
	fx
	fzf
	gnuplot
	graphviz
	htop
	hugo
	hyperfine
	imagemagick
	jq
	languagetool
	miniserve
	moreutils
	mpc
	neovim
	nmap
	node
	nvm
	oxipng
	platformio
	podman
	ripgrep
	rsync
	rustup
	shellcheck
	shfmt
	starship
	tokei
	typos-cli
	watch
	wget
	yamllint
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

# Remove the quarantine flag to allow macOS to run these "untrusted" extensions
xattr -d -r com.apple.quarantine ~/Library/QuickLook
