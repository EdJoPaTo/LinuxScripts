#!/usr/bin/env bash
set -eu

user="${DOAS_USER:-$SUDO_USER}"

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
	curl
	ddcutil
	difftastic
	dust
	eog # image viewer
	exa
	fd
	file-roller # archives
	flatpak
	fx # Terminal JSON viewer
	fzf
	git
	gnome-calculator
	gnome-characters
	gnome-disk-utility
	gnuradio-companion
	gnuradio-osmosdr
	gucharmap
	helix # cli text editor
	htop
	hugo
	hyperfine
	jq
	libreoffice-fresh
	moreutils # sponge, ts
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
	yt-dlp

	# programming rust
	rustup
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

	# casual games
	gnome-mines
	gnome-sudoku
)

DEPS=(
	bash-completion
	eog-plugins
	gnome-themes-extra # Adwaita-dark
	libmythes # Languages
	npm
	podman-compose
	python-pygments # hugo: syntax-highlight code snippets
	scour # inkscape optimized svg
	sshpass # ansible
	trash-cli
	webp-pixbuf-loader # webp support for image viewers
	xdg-desktop-portal
	xdg-desktop-portal-gnome # desktop / window sharing
	xdg-utils

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

	# neovim
	python-pynvim
	wl-clipboard

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
	element-desktop # test fractal when SSO works https://gitlab.gnome.org/GNOME/fractal/-/issues/521
	obs-studio
	pandoc
	reflector # Update mirrorlist
	shellcheck
	signal-desktop
	steam
	teamspeak3

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
	echo "v4l2loopback" >/etc/modules-load.d/v4l2.conf
fi

# report package usage
systemctl start pkgstats.timer

# communicate with monitors via ddc (ddcutil)
echo "i2c-dev" >/etc/modules-load.d/ddc.conf

# podman rootless usage
touch -a /etc/subuid /etc/subgid
usermod --add-subuids 165536-231072 --add-subgids 165536-231072 "$user"
# in case of problems run as user: podman system migrate

# Arduino
usermod -aG uucp,lock "$user"

usermod -aG wireshark "$user"

# sensors
sensors-detect --auto
