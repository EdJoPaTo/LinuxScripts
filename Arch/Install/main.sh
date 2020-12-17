#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

# arch
sudo pacman $param base base-devel pacman-contrib
sudo pacman $param --asdeps bash-completion

# report package usage
sudo pacman $param pkgstats
sudo systemctl start pkgstats.timer

# zsh
sudo pacman $param zsh zsh-completions zsh-history-substring-search zsh-syntax-highlighting

# console unsorted
sudo pacman $param lshw

# console status
sudo pacman $param htop bashtop bpytop

# console multiplexer
sudo pacman $param tmux screen

# console benchmarking
sudo pacman $param hyperfine

# console Disk Usage Analyzer
sudo pacman $param dua-cli

# network communication
sudo pacman $param git openssh rsync wget curl inetutils

# console network analysis
sudo pacman $param net-tools nmap traceroute mtr whois nload iftop

# mqtt cli tools (TODO: maybe only a client cli thingy instead of a mainly broker package?)
sudo pacman $param mosquitto

# view and find files
sudo pacman $param exa fd tree

# find in file via `rg`
sudo pacman $param ripgrep

# programming
sudo pacman $param cmake clang

# count lines of code
sudo pacman $param cloc tokei

# Picture Tools
sudo pacman $param imagemagick graphviz gnuplot

# Audio / Video Tools
sudo pacman $param ffmpeg python-eyed3 youtube-dl

# nodejs
sudo pacman $param nodejs
sudo pacman $param --asdeps npm

# docker
sudo pacman $param docker

# ansible
sudo pacman $param ansible ansible-lint
sudo pacman $param --asdeps sshpass

# sensors
sudo pacman $param lm_sensors acpi
sudo sensors-detect --auto
