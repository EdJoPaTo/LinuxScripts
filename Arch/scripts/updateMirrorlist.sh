#!/bin/sh
set -e

echo "Download Mirrorlist and rank them..."
reflector --latest 100 --protocol https --ipv4 --ipv6 --country de,be,fr,nl --connection-timeout 1 --sort rate > /tmp/mirrorlist
echo "Backup old mirrorlist"
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo "Set new mirrorlist"
sudo mv /tmp/mirrorlist /etc/pacman.d/mirrorlist

echo "Download Updates with new Mirrorlist"
sudo pacman -Syyuw --noconfirm
