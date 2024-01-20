#!/usr/bin/env bash
set -eu

EXPLICIT=(
	acpi
	alacritty
	ansible
	ansible-lint
	baobab # Disk Usage Analyzer
	bat
	bind # dns
	btop
	curl
	ddcutil
	difftastic
	dive # explore container layers
	dog # dns
	dust
	evince # document viewer (PDF, …)
	eza
	fd
	file-roller # archives
	fish
	flatpak
	fx # Terminal JSON viewer
	fzf
	gdm
	git
	gnome-backgrounds
	gnome-browser-connector
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
	helix # cli text editor
	htop
	hugo
	hyperfine
	jq
	kanshi # automatic monitor config
	libreoffice-fresh
	lostfiles
	loupe # image viewer
	lshw
	moreutils # sponge, ts
	mumble
	nano
	nautilus
	neovim
	networkmanager
	newsflash
	nmap
	npm
	opendoas
	openssh
	pdfpc
	pkgstats
	platformio-core
	podman
	ripgrep
	rsync
	snapshot # camera and webcam
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
	wget
	whois # domain checks
	xdg-user-dirs
	xorg-xeyes
	yq
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

	# Languages
	hunspell-de
	hunspell-en_gb
	hunspell-en_us
	hyphen-de
	hyphen-en
	languagetool
	mythes-de
	mythes-en

	# fonts
	noto-fonts-emoji # emoji support (in terminal, notifications, ...)
	ttf-dejavu
	ttf-firacode-nerd
	ttf-font-awesome
	ttf-opensans

	# Preview in Filemanager
	totem
	ffmpegthumbnailer

	# Picture Tools
	d2
	gimp
	gnuplot
	imagemagick
	inkscape
	oxipng

	# Audio / Video Tools
	ffmpeg
	helvum # pipewire patch bay
	kid3-qt
	mpc
	mpd
	mpv
	pavucontrol
	yt-dlp

	# programming rust
	rustup
	cross
	cargo-audit
	cargo-expand
	cargo-flamegraph
	cargo-geiger
	cargo-hack
	cargo-llvm-cov
	cargo-msrv
	cargo-outdated
	cargo-sort
	cargo-spellcheck

	# programming language server
	bash-language-server
	lua-language-server
	python-lsp-server
	shfmt
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
	## https://addons.mozilla.org/firefox/addon/gnome-shell-integration/
	## https://addons.mozilla.org/firefox/addon/localcdn-fork-of-decentraleyes/
	## https://addons.mozilla.org/firefox/addon/privacy-redirect/
	## https://addons.mozilla.org/firefox/addon/temporary-containers/
)

DEPS=(
	bash-completion
	fuse-overlayfs # podman
	fwupd
	gnome-control-center
	gnome-themes-extra # Adwaita-dark
	libmythes # thesaurus
	linux
	linux-firmware
	lm_sensors
	lsof # show files of a process in htop
	platformio-core-udev
	qt5-wayland
	qt6-wayland
	wireplumber
	wl-clipboard
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
	atomicparsley
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
		lib32-vulkan-intel
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

ln -sf /usr/bin/helix /usr/bin/hx
ln -sf /usr/bin/xdg-open /usr/bin/open

# report package usage
systemctl start pkgstats.timer

# communicate with monitors via ddc (ddcutil)
echo "i2c-dev" >/etc/modules-load.d/ddc.conf

# sensors
sensors-detect --auto
