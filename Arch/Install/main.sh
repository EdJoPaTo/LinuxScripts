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
	dust
	exa
	fd
	git
	htop
	hugo
	hyperfine
	jq
	most # as MANPAGER
	nano
	neovim
	networkmanager
	networkmanager-openvpn
	nodejs
	openconnect
	opendoas
	openssh
	pkgstats
	podman
	progress
	ripgrep
	rsync
	speedtest-cli
	starship
	syncthing
	tealdeer # tldr
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
	devtools # build/test AUR packages
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
	nload
	nmap
	whois

	# Picture Tools
	gnuplot
	python-matplotlib
	graphviz
	imagemagick
	oxipng

	# Audio / Video Tools
	ffmpeg
	yt-dlp

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
	cargo-flamegraph
	cargo-outdated
	cargo-sort
	cargo-udeps
	cargo-watch
)

if [ "$(uname -m)" == "x86_64" ]; then
EXPLICIT+=(
	cargo-tarpaulin
	pandoc
	reflector # Update mirrorlist
	shellcheck
)
fi

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

	# neovim
	python-neovim
	wl-clipboard
	xclip

	# podman
	catatonit # --init
)

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}" "${EXPLICIT_GROUPS[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}" $(pacman -Qgq "${EXPLICIT_GROUPS[@]}")

# report package usage
systemctl start pkgstats.timer

# podman rootless usage
touch -a /etc/subuid /etc/subgid
usermod --add-subuids 165536-231072 --add-subgids 165536-231072 "$(logname)"
# in case of problems run as user: podman system migrate

# sensors
sensors-detect --auto
