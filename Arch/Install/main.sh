#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

# arch
sudo pacman $param base base-devel pacman-contrib
sudo pacman $param --asdeps bash-completion

# console
sudo pacman $param git htop openssh wget rsync screen tmux tree acpi hwinfo

# console network tools
sudo pacman $param nmap traceroute mtr whois

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
