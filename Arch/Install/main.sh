#!/bin/bash
sudo pacman -Sy

param="--noconfirm --needed -S"

# arch
sudo pacman $param binutils fakeroot patch bash-completion

# console
sudo pacman $param sudo git htop openssh wget rsync screen tree acpi apg

# console network tools
sudo pacman $param nmap traceroute mtr whois

# programming
sudo pacman $param make cmake gcc cloc

# Picture Tools
sudo pacman $param imagemagick

# lol
# sudo pacman $param sl lolcat

# sensors
sudo pacman $param lm_sensors
sudo sensors-detect --auto

