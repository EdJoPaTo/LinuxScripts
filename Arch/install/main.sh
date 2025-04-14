#!/usr/bin/env bash
set -eu -o pipefail

EXPLICIT=(
	aisleriot
	alacritty
	ansible
	ansible-lint
	bat
	btop
	ddcutil
	difftastic
	dive # explore container layers
	dust
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
	gnome-themes-extra # Adwaita-dark
	htop
	hugo
	hyperfine
	libreoffice-fresh
	lostfiles
	loupe # image viewer
	miniserve
	mqttui
	mumble
	nautilus
	neovim
	networkmanager
	newsflash
	npm
	nvm
	opendoas
	openssh
	papers
	pdfpc
	pkgstats
	platformio-core
	podman
	remmina
	ripgrep
	ripgrep-all
	shfmt
	starship
	syncthing
	tealdeer # tldr
	telegram-desktop
	texlive-langenglish
	texlive-langgerman
	texlive-meta
	tinyxxd
	tmux
	tokei
	trash-cli
	xorg-xeyes # easily know which windows are still X11
	zed
	zsh-completions
	zsh-history-substring-search
	zsh-syntax-highlighting

	# arch base
	base
	base-devel
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
	otf-atkinson-hyperlegible
	ttf-atkinson-hyperlegible
	ttf-dejavu
	ttf-firacode-nerd

	# Preview in Filemanager
	ffmpegthumbnailer

	# picture
	d2
	gimp
	gnuplot
	graphviz
	imagemagick
	inkscape
	oxipng

	# audio / video
	ffmpeg
	helvum
	kid3-qt
	mpc
	mpd
	mpd-mpris
	mpv
	mpv-mpris
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

	# programming Rust
	rustup
	cargo-audit
	cargo-expand
	cargo-flamegraph
	cargo-generate
	cargo-hack
	cargo-llvm-cov
	cargo-msrv
	cargo-nextest
	cargo-outdated
	cargo-public-api
	cargo-semver-checks
	cargo-show-asm
	cargo-sort
	cargo-spellcheck
	cross
	espflash
	espup

	# Browser
	chromium
	firefox
	firefox-dark-reader
	firefox-ublock-origin
	## https://addons.mozilla.org/firefox/addon/clearurls/
	## https://addons.mozilla.org/firefox/addon/languagetool/
	## https://addons.mozilla.org/firefox/addon/privacy-redirect/
	## https://addons.mozilla.org/firefox/addon/sponsorblock/
)

DEPS=(
	bash-completion
	crun
	dbus-broker-units
	freerdp
	fuse-overlayfs # podman
	gnome-control-center
	gnu-netcat
	libmythes # thesaurus
	linux
	linux-firmware
	lm_sensors
	mkinitcpio
	platformio-core-udev
	qt5-wayland
	qt6-wayland
	xdg-utils # xdg-open

	# Audio / Video Tools
	pipewire-jack
	pipewire-pulse
	pipewire-v4l2
	python-mutagen
	wireplumber

	# file-roller optionals
	7zip
	# lrzip
	# squashfs-tools
	# unace
	# unrar
	unzip
	zip

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

# Set doas settings
echo "permit setenv { EDITOR VISUAL LANG LC_ALL LC_ADDRESS LC_MEASUREMENT LC_MONETARY LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME } :wheel" >/etc/doas.conf

# npm is updated by the system (or nvm)
echo "update-notifier=false" >/etc/npmrc

# communicate with monitors via ddc (ddcutil)
echo "i2c-dev" >/etc/modules-load.d/ddc.conf

# Prevent to expose user mpd.socket to the network
sed -i 's/=6600/=127.0.0.1:6600/g' /usr/lib/systemd/user/mpd.socket

ln --symbolic --force /usr/bin/xdg-open /usr/local/bin/open
ln --symbolic --force /usr/bin/zeditor /usr/local/bin/zed

# sensors
sensors-detect --auto >/dev/null
