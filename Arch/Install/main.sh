#!/usr/bin/env bash
set -e

EXPLICIT_GROUPS=(
	base-devel
)

EXPLICIT=(
	ansible
	ansible-lint
	bat
	curl
	deno
	dua-cli
	exa
	fail2ban
	fd
	git
	htop
	hugo
	hyperfine
	nano
	networkmanager
	networkmanager-openvpn
	nodejs
	openconnect
	opendoas
	openssh
	pandoc
	pkgstats
	podman
	progress
	reflector
	ripgrep
	rsync
	shellcheck
	speedtest-cli
	starship
	syncthing
	tmux
	tokei
	wget
	xdg-user-dirs
	zsh
	zsh-completions
	zsh-history-substring-search
	zsh-syntax-highlighting

	# arch base
	base
	man-db
	man-pages
	pacman-contrib

	# build environments
	clang
	cmake
	desktop-file-utils
	go
	meson
	vala

	# console network analysis
	bandwhich
	dog
	iftop
	inetutils
	mtr
	nload
	nmap
	whois

	# Picture Tools
	gnuplot
	graphviz
	imagemagick
	oxipng

	# Audio / Video Tools
	ffmpeg
	python-eyed3
	youtube-dl

	# system readout / sensors
	acpi
	lm_sensors
	lostfiles
	lshw

	# programming rust
	rustup
	rust-analyzer
	cargo-audit
	cargo-bloat
	cargo-edit
	cargo-outdated
	cargo-tarpaulin
	cargo-udeps
	cargo-watch
)

DEPS=(
	bash-completion
	npm

	# ansible
	sshpass

	# Audio / Video Tools
	atomicparsley
	python-pycryptodome
	rtmpdump

	# hugo: syntax-highlight code snippets
	python-pygments

	# podman
	catatonit # --init
)

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}" "${EXPLICIT_GROUPS[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}" $(pacman -Qgq "${EXPLICIT_GROUPS[@]}")

# report package usage
systemctl start pkgstats.timer

# podman rootless usage
touch -a /etc/subuid /etc/subgid
usermod --add-subuids 165536-231072 --add-subgids 165536-231072 "$USER"

# sensors
sensors-detect --auto
