#!/usr/bin/sh
set -e

sudo pacman -Sy

param="--noconfirm --needed -S"

# arch
sudo pacman $param base base-devel pacman-contrib
sudo pacman $param --asdeps bash-completion

# zsh
sudo pacman $param zsh zsh-completions zsh-history-substring-search zsh-syntax-highlighting

# console
sudo pacman $param git htop openssh wget rsync screen tmux tree acpi hwinfo

# console network tools
sudo pacman $param nmap traceroute mtr whois

# Print related
sudo pacman $param cups cups-pdf

# programming
sudo pacman $param cmake cloc

# Picture Tools
sudo pacman $param imagemagick graphviz gnuplot

# lol
# sudo pacman $param sl lolcat

# nodejs
sudo pacman $param nodejs
sudo pacman $param --asdeps npm

# docker
sudo pacman $param docker

# sensors
sudo pacman $param lm_sensors
sudo sensors-detect --auto
