#!/usr/bin/env bash
set -e

EXPLICIT=(
    ansible
    ansible-lint
    bat
    clang
    cmake
    curl
    docker
    dua-cli
    git
    htop
    hugo
    hyperfine
    lostfiles
    lshw
    nano
    networkmanager
    networkmanager-openvpn
    nodejs
    opendoas
    openssh
    pkgstats
    podman
    podman-compose
    progress
    reflector
    ripgrep
    rsync
    speedtest-cli
    starship
    tmux
    vi
    wget
    xdg-user-dirs
    zsh
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting

    # arch base
    base
    base-devel
    man-db
    man-pages
    pacman-contrib

    # console network analysis
    bandwhich
    dog
    iftop
    inetutils
    mtr
    nload
    nmap
    whois

    # view and find files
    exa
    fd
    tree

    # Picture Tools
    gnuplot
    graphviz
    imagemagick
    oxipng

    # Audio / Video Tools
    ffmpeg
    python-eyed3
    youtube-dl

    # sensors
    acpi
    lm_sensors

    # count lines of code
    cloc
    tokei

    # programming rust
    rustup
    rust-analyzer
    cargo-audit
    cargo-edit
    cargo-outdated
    cargo-tarpaulin
    cargo-watch
)

DEPS=(
    bash-completion
    npm

    # ansible
    sshpass

    # hugo: syntax-highlight code snippets
    python-pygments

    # podman
    catatonit # --init
)

sudo pacman -Sy

sudo pacman --noconfirm --needed -S --asdeps "${DEPS[@]}"
sudo pacman --noconfirm --needed -S "${EXPLICIT[@]}"

# report package usage
sudo systemctl start pkgstats.timer

# podman rootless usage
sudo touch -a /etc/subuid /etc/subgid
sudo usermod --add-subuids 165536-231072 --add-subgids 165536-231072 $USER
podman system migrate

# programming rust
../../Install/rust.sh

# sensors
sudo sensors-detect --auto
