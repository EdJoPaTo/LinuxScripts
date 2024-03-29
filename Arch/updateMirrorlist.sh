#!/usr/bin/env bash
set -eux -o pipefail

echo "Download Mirrorlist and rank them..."
reflector --latest 20 --protocol https --ipv4 --ipv6 --country de,be,fr,nl --connection-timeout 1 --sort rate | tee /tmp/mirrorlist
echo "Backup old mirrorlist"
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo "Set new mirrorlist"
sudo mv /tmp/mirrorlist /etc/pacman.d/mirrorlist
sudo chown -R root:root /etc/pacman.d

echo "Download Updates with new Mirrorlist"
sudo pacman -Syy --asdeps --needed --noconfirm archlinux-keyring
sudo pacman -Syuw --noconfirm
