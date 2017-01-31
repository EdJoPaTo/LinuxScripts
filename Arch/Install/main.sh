#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

# arch
sudo pacman $param base-devel
sudo pacman $param --asdeps bash-completion

# console
sudo pacman $param git htop openssh wget rsync screen tree acpi apg

# console network tools
sudo pacman $param nmap traceroute mtr whois

# programming
sudo pacman $param cmake cloc

# Picture Tools
sudo pacman $param imagemagick graphviz

# lol
# sudo pacman $param sl lolcat

# sensors
sudo pacman $param lm_sensors
sudo sensors-detect --auto
