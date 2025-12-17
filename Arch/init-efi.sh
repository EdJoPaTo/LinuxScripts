#!/usr/bin/env sh
set -eu

efibootmgr \
	--create \
	--disk /dev/sda \
	--part 1 \
	--label 'Arch Linux' \
	--loader /vmlinuz-linux \
	--unicode \
	'root=/dev/sda2 rw initrd=\initramfs-linux.img'
