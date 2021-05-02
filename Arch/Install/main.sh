#!/usr/bin/env bash
set -e

EXPLICIT_GROUPS=(
    base-devel
)

EXPLICIT=(
    ansible
    ansible-lint
    bat
    clang
    cmake
    curl
    deno
    docker
    dua-cli
    fail2ban
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
    shellcheck
    speedtest-cli
    starship
    syncthing
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

pacman --noconfirm --needed -Sy --asdeps "${DEPS[@]}" "${EXPLICIT[@]}" "${EXPLICIT_GROUPS[@]}"
pacman -D --asexplicit --quiet "${EXPLICIT[@]}" $(pacman -Qgq "${EXPLICIT_GROUPS[@]}")

# report package usage
systemctl start pkgstats.timer

# podman rootless usage
touch -a /etc/subuid /etc/subgid
usermod --add-subuids 165536-231072 --add-subgids 165536-231072 "$USER"

# sensors
sensors-detect --auto
