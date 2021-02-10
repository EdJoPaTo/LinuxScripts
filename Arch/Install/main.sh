#!/usr/bin/sh
set -e

EXPLICIT=(
    ansible
    ansible-lint
    clang
    cmake
    curl
    docker
    git
    hugo
    lshw
    nano
    opendoas
    openssh
    podman
    podman-compose
    progress
    reflector
    rsync
    speedtest-cli
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

    # report package usage
    pkgstats

    # console system status
    htop
    bashtop
    bpytop

    # console benchmarking
    hyperfine

    # console Disk Usage Analyzer
    dua-cli

    # network communication
    inetutils
    networkmanager
    networkmanager-openvpn

    # console network analysis
    bandwhich
    dog
    iftop
    mtr
    nload
    nmap
    traceroute
    whois

    # view and find files
    exa
    fd
    tree

    # find in file via `rg`
    ripgrep

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

    # programming nodejs
    nodejs
    nvm

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

# programming rust
../../Install/rust.sh

# sensors
sudo sensors-detect --auto
