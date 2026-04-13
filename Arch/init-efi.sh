#!/usr/bin/env sh
set -eu

# This script assumes that nvme0n1p1 is /boot and p2 the encrypted /
#
# lsblk --output NAME,SIZE,TYPE,MOUNTPOINTS,UUID

uuid=$(blkid --match-tag=UUID --output=value /dev/nvme0n1p2)

efibootmgr \
	--create \
	--disk /dev/nvme0n1 \
	--part 1 \
	--label 'Arch Linux' \
	--loader /vmlinuz-linux \
	--unicode \
	"rd.luks.name=$uuid=root root=/dev/mapper/root rw initrd=\initramfs-linux.img"
