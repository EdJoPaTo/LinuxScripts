#!/usr/bin/env bash
set -eu -o pipefail

efibootmgr \
	--create \
	--disk /dev/sda \
	--part 1 \
	--label 'Arch Linux' \
	--loader /vmlinuz-linux \
	--unicode \
	'root=/dev/sda2 rw initrd=\intel-ucode.img initrd=\initramfs-linux.img'
