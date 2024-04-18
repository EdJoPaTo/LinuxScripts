#!/usr/bin/env bash
set -eu -o pipefail

EXPLICIT=(
	alacritty
	ansible
	ansible-lint
	bat
	btop
	ddcutil
	difftastic
	dive # explore container layers
	dust
	evince # document viewer (PDF, …)
	eza
	fd
	file-roller # archives
	fish
	flatpak
	fzf
	gdm
	git
	gnome-backgrounds
	gnome-calculator
	gnome-characters
	gnome-console
	gnome-disk-utility
	gnome-power-manager
	gnome-screenshot
	gnome-shell-extension-caffeine
	gnome-software
	gnome-sudoku
	gnome-text-editor
	htop
	hugo
	hyperfine
	kanshi # automatic monitor config
	libreoffice-fresh
	lostfiles
	loupe # image viewer
	miniserve
	mumble
	nano
	nautilus
	neovim
	networkmanager
	newsflash
	npm
	opendoas
	openssh
	pdfpc
	pkgstats
	platformio-core
	podman
	ripgrep
	shfmt
	starship
	syncthing
	tealdeer # tldr
	telegram-desktop
	texlive-langenglish
	texlive-langgerman
	texlive-meta
	tmux
	tokei
	trash-cli
	vim # xxd
	zsh-completions
	zsh-history-substring-search
	zsh-syntax-highlighting

	# Sway https://wiki.archlinux.org/title/Sway
	sway
	fuzzel
	grim # sway screenshots
	i3status-rust
	playerctl

	# arch base
	base
	base-devel
	dbus-broker-units
	devtools
	efibootmgr
	man-db
	man-pages
	pacman-contrib

	# languages
	hunspell-de
	hunspell-en_gb
	hunspell-en_us
	hyphen-de
	hyphen-en
	languagetool
	mythes-de
	mythes-en
	typos

	# fonts
	noto-fonts-emoji # emoji support (in terminal, notifications, ...)
	ttf-dejavu
	ttf-firacode-nerd
	ttf-font-awesome
	ttf-opensans

	# Preview in Filemanager
	totem
	ffmpegthumbnailer

	# picture
	d2
	gimp
	gnuplot
	imagemagick
	inkscape
	oxipng

	# audio / video
	ffmpeg
	helvum # pipewire patch bay
	kid3-qt
	mpc
	mpd
	mpv
	mpv-mpris
	pavucontrol
	yt-dlp

	# data
	fx
	yq # and thereby jq

	# network
	bind
	curl
	dog
	nmap
	rsync
	wget
	whois

	# programming rust
	rustup
	cross
	cargo-audit
	cargo-expand
	cargo-flamegraph
	cargo-geiger
	cargo-generate
	cargo-hack
	cargo-llvm-cov
	cargo-msrv
	cargo-semver-checks
	cargo-nextest
	cargo-outdated
	cargo-public-api
	cargo-sort
	cargo-spellcheck

	# programming language server
	ansible-language-server
	bash-language-server
	gopls
	lua-language-server
	python-lsp-server
	typescript-language-server
	vscode-css-languageserver
	vscode-html-languageserver
	vscode-json-languageserver
	yaml-language-server

	# Browser
	chromium
	firefox
	firefox-dark-reader
	firefox-ublock-origin
	## https://addons.mozilla.org/firefox/addon/clearurls/
	## https://addons.mozilla.org/firefox/addon/languagetool/
	## https://addons.mozilla.org/firefox/addon/localcdn-fork-of-decentraleyes/
	## https://addons.mozilla.org/firefox/addon/privacy-redirect/
	## https://addons.mozilla.org/firefox/addon/temporary-containers/
)

DEPS=(
	bash-completion
	fuse-overlayfs # podman
	gnome-control-center
	gnome-themes-extra # Adwaita-dark
	libmythes # thesaurus
	linux
	linux-firmware
	lm_sensors
	lsof # show files of a process in htop
	platformio-core-udev
	power-profiles-daemon
	qt5-wayland
	qt6-wayland
	wireplumber
	xdg-desktop-portal-gnome
	xdg-desktop-portal-wlr
	xdg-utils # xdg-open

	# Sway
	polkit
	slurp # select an area for screenshots
	swaybg
	swayidle
	swaylock

	# Audio / Video Tools
	pipewire-jack
	pipewire-pulse
	pipewire-v4l2
	python-mutagen

	# file-roller optionals
	# lrzip
	p7zip
	# squashfs-tools
	# unace
	# unrar

	# remote locations
	gvfs-afc
	gvfs-goa
	gvfs-gphoto2
	gvfs-smb
)

if [ "$(uname -m)" == "x86_64" ]; then
	EXPLICIT+=(
		code
		deno
		obs-studio
		reflector # Update mirrorlist
		shellcheck
		signal-desktop
		teamspeak3

		# Intel NUC
		intel-media-sdk
		intel-ucode
		libva-intel-driver
		linux
		vulkan-intel
		# lib32-vulkan-intel
	)

	DEPS+=(
		linux-headers # dkms
		v4l2loopback-dkms # obs virtual cam
	)
fi

pacman --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}"

if [ "$(uname -m)" == "x86_64" ]; then
	echo "v4l2loopback" >/etc/modules-load.d/v4l2.conf
fi

# report package usage
systemctl start pkgstats.timer

# communicate with monitors via ddc (ddcutil)
echo "i2c-dev" >/etc/modules-load.d/ddc.conf

# Prevent to expose user mpd.socket to the network
sed -i 's/=6600/=127.0.0.1:6600/g' /usr/lib/systemd/user/mpd.socket

# sensors
sensors-detect --auto
