#!/bin/sh -e

echo "Download Mirrorlist and rank them..."
curl --silent "https://www.archlinux.org/mirrorlist/?country=DE&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on" \
	| sed 's/^#Server/Server/' \
	| sed '/^#/ d' \
	| rankmirrors -v -n 6 - | tee /dev/tty \
	| sed '/^#/ d' \
	> /tmp/mirrorlist
echo "Backup old mirrorlist"
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo "Set new mirrorlist"
sudo mv /tmp/mirrorlist /etc/pacman.d/mirrorlist

echo "Download Updates with new Mirrorlist"
sudo pacman -Syyuw --noconfirm
