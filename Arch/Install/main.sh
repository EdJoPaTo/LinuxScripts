#!/usr/bin/env bash
set -e

EXPLICIT_GROUPS=(
	base-devel
	texlive-most
)

EXPLICIT=(
	alacritty
	ansible
	ansible-lint
	arduino
	baobab # Disk Usage Analyzer
	bat
	cmatrix
	curl
	ddcutil
	difftastic
	dust
	eog # image viewer
	exa
	fd
	file-roller # archives
	flatpak
	fractal
	fzf
	git
	gnome-calculator
	gnome-characters
	gnome-disk-utility
	gnome-weather
	gnuradio-companion
	gnuradio-osmosdr
	gucharmap
	htop
	hugo
	hyperfine
	jq
	libreoffice-fresh
	moreutils # /usr/bin/ts
	most # as MANPAGER
	mumble
	nano
	neovim
	networkmanager
	newsflash
	nodejs
	openconnect
	opendoas
	openssh
	pdfpc
	pkgstats
	podman
	progress
	remmina
	ripgrep
	rsync
	speedtest-cli
	starship
	syncthing
	tealdeer # tldr
	telegram-desktop
	tiled
	tmux
	tokei
	wget
	wireshark-qt
	xdg-user-dirs
	yq
	zsh
	zsh-completions
	zsh-history-substring-search
	zsh-syntax-highlighting

	# arch base
	base
	devtools # build/test AUR packages
	efibootmgr
	efivar
	man-db
	man-pages
	pacman-contrib

	# large build environments often used for AUR packages
	clang
	cmake
	go
	meson
	vala

	# console network analysis
	dog
	mtr
	nmap
	whois

	# system readout / sensors
	acpi
	lm_sensors
	lostfiles
	lshw

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
	ttf-opensans

	# Preview in Filemanager
	totem
	ffmpegthumbnailer

	# Picture Tools
	gimp
	gnuplot
	graphviz
	imagemagick
	inkscape
	oxipng
	python-matplotlib

	# Audio / Video Tools
	ffmpeg
	helvum # pipewire patch bay
	kid3-qt
	mpc
	mpd
	mpv
	pavucontrol
	vlc
	xfmpc
	yt-dlp

	# programming rust
	rustup
	rust-analyzer
	cargo-audit
	cargo-edit
	cargo-flamegraph
	cargo-sort

	# Browser
	firefox
	firefox-dark-reader
	firefox-ublock-origin
	## https://addons.mozilla.org/firefox/addon/clearurls/
	## https://addons.mozilla.org/firefox/addon/localcdn-fork-of-decentraleyes/
	## https://addons.mozilla.org/firefox/addon/privacy-redirect/
	## https://addons.mozilla.org/firefox/addon/temporary-containers/

	# casual games
	gnome-mines
	gnome-sudoku
)

DEPS=(
	arduino-avr-core
	bash-completion
	catatonit # podman run --init
	eog-plugins
	gnome-themes-extra
	libmythes # Languages
	npm
	python-pygments # hugo: syntax-highlight code snippets
	sshpass # ansible
	trash-cli
	xdg-desktop-portal
	xdg-desktop-portal-gnome # desktop / window sharing

	# Audio / Video Tools
	atomicparsley
	pipewire-jack
	pipewire-pulse
	pipewire-v4l2
	rtmpdump

	# file-roller optionals
	lrzip
	p7zip
	squashfs-tools
	unace
	unrar

	# inkscape optimized svg
	python-numpy
	python-lxml
	scour

	# neovim
	python-pynvim
	wl-clipboard
	xclip

	# remmina remote desktop
	freerdp
	libvncserver

	# remote locations
	gvfs-afc
	gvfs-smb
	gvfs-gphoto2
	gvfs-mtp
	gvfs-goa
	gvfs-nfs
	gvfs-google
)

if [ "$(uname -m)" == "x86_64" ]; then
EXPLICIT+=(
	cargo-tarpaulin
	code
	deno
	discord
	dotnet-sdk
	element-desktop # test fractal when SSO works https://gitlab.gnome.org/GNOME/fractal/-/issues/521
	obs-studio
	pandoc
	reflector # Update mirrorlist
	shellcheck
	signal-desktop
	steam
	teamspeak3
	veracrypt

	amd-ucode
	intel-ucode
)

DEPS+=(
	linux-headers # dkms
	v4l2loopback-dkms # obs virtual cam
)
fi

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}" "${EXPLICIT_GROUPS[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}" $(pacman -Qgq "${EXPLICIT_GROUPS[@]}")

if [ "$(uname -m)" == "x86_64" ]; then
# load v4l2loopback
echo "v4l2loopback" > /etc/modules-load.d/v4l2.conf
fi

# report package usage
systemctl start pkgstats.timer

# communicate with monitors via ddc (ddcutil)
echo "i2c-dev" > /etc/modules-load.d/ddc.conf

# podman rootless usage
touch -a /etc/subuid /etc/subgid
usermod --add-subuids 165536-231072 --add-subgids 165536-231072 "$(logname)"
# in case of problems run as user: podman system migrate

# Arduino
usermod -aG uucp,lock "$(logname)"

usermod -aG wireshark "$(logname)"

# sensors
sensors-detect --auto
