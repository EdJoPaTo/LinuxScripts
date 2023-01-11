#!/usr/bin/env bash
set -eu

EXPLICIT_GROUPS=(
	base-devel
	texlive-most
)

EXPLICIT=(
	alacritty
	ansible
	ansible-lint
	baobab # Disk Usage Analyzer
	bat
	bind # dns
	curl
	ddcutil
	difftastic
	dog # dns
	dust
	eog # image viewer
	evince # document viewer (PDF, …)
	exa
	fd
	file-roller # archives
	flatpak
	fx # Terminal JSON viewer
	fzf
	gdm
	git
	gnome-backgrounds
	gnome-calculator
	gnome-console
	gnome-power-manager
	gnome-screenshot
	gnome-software
	gnome-sudoku
	gnome-text-editor
	gnome-tweaks
	gnuradio-companion
	gnuradio-osmosdr
	helix # cli text editor
	htop
	hugo
	hyperfine
	jq
	libreoffice-fresh
	lshw
	moreutils # sponge, ts
	most # as MANPAGER
	mumble
	nano
	nautilus
	neovim
	networkmanager
	newsflash
	nmap
	nodejs
	openconnect
	opendoas
	trash-cli
	openssh
	pdfpc
	pkgstats
	podman
	ripgrep
	rsync
	speedtest-cli
	starship
	syncthing
	tealdeer # tldr
	telegram-desktop
	tmux
	tokei
	wget
	whois # domain checks
	yq
	zsh
	zsh-completions
	zsh-history-substring-search
	xdg-user-dirs
	zsh-syntax-highlighting

	# Sway https://wiki.archlinux.org/title/Sway
	sway
	fuzzel
	grim # sway screenshots
	i3status-rust
	playerctl
	wl-clipboard

	# arch base
	base
	efibootmgr
	efivar
	man-db
	man-pages
	pacman-contrib

	# system readout / sensors
	acpi
	lm_sensors
	lostfiles

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
	ttf-font-awesome
	ttf-opensans

	# Preview in Filemanager
	totem
	ffmpegthumbnailer

	# Picture Tools
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
	cargo-flamegraph
	cargo-msrv
	cargo-sort

	# programming language server
	bash-language-server
	lua-language-server
	python-lsp-server
	rust-analyzer
	shfmt
	texlab
	typescript-language-server
	vscode-css-languageserver
	vscode-html-languageserver
	vscode-json-languageserver
	yaml-language-server

	# Browser
	firefox
	firefox-dark-reader
	firefox-ublock-origin
	## https://addons.mozilla.org/firefox/addon/clearurls/
	## https://addons.mozilla.org/firefox/addon/firefox-translations/
	## https://addons.mozilla.org/firefox/addon/gnome-shell-integration/
	## https://addons.mozilla.org/firefox/addon/localcdn-fork-of-decentraleyes/
	## https://addons.mozilla.org/firefox/addon/privacy-redirect/
	## https://addons.mozilla.org/firefox/addon/temporary-containers/
)

DEPS=(
	bash-completion
	eog-plugins
	gnome-control-center
	gnome-themes-extra # Adwaita-dark
	libmythes # Languages
	npm
	python-pygments # hugo: syntax-highlight code snippets
	scour # inkscape optimized svg
	webp-pixbuf-loader # webp support for image viewers
	xdg-desktop-portal
	xdg-desktop-portal-gnome # desktop / window sharing
	xdg-desktop-portal-wlr
	xdg-utils # xdg-open

	# Sway
	bemenu-wayland
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
	rtmpdump

	# file-roller optionals
	# lrzip
	p7zip
	# squashfs-tools
	# unace
	# unrar

	# remote locations
	gvfs-afc
	gvfs-smb
	gvfs-gphoto2
	gvfs-goa
)

if [ "$(uname -m)" == "x86_64" ]; then
	EXPLICIT+=(
		cargo-tarpaulin
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
	)

	DEPS+=(
		linux-headers # dkms
		v4l2loopback-dkms # obs virtual cam
	)
fi

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}" "${EXPLICIT_GROUPS[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}" $(pacman -Qgq "${EXPLICIT_GROUPS[@]}")

if [ "$(uname -m)" == "x86_64" ]; then
	echo "v4l2loopback" >/etc/modules-load.d/v4l2.conf
fi

# report package usage
systemctl start pkgstats.timer

# communicate with monitors via ddc (ddcutil)
echo "i2c-dev" >/etc/modules-load.d/ddc.conf

# sensors
sensors-detect --auto
