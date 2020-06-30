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
sudo pacman $param exa tree

# console status
sudo pacman $param htop bashtop

# console multiplexer
sudo pacman $param tmux screen

# network communication
sudo pacman $param git openssh rsync wget curl

# console network analysis
sudo pacman $param net-tools nmap traceroute mtr whois nload

# find in file via `ag`
sudo pacman $param the_silver_searcher

# printer
sudo pacman $param cups cups-pdf

# programming
sudo pacman $param cmake cloc clang

# Picture Tools
sudo pacman $param imagemagick graphviz gnuplot

# Audio / Video Tools
sudo pacman $param ffmpeg python-eyed3

# lol
# sudo pacman $param sl lolcat

# nodejs
sudo pacman $param nodejs
sudo pacman $param --asdeps npm

# docker
sudo pacman $param docker

# sensors
sudo pacman $param lm_sensors acpi
sudo sensors-detect --auto
