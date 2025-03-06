#!/usr/bin/env bash
set -eu

sudo lostfiles -s |
	rg -v ^/boot/initramfs |
	rg -v ^/etc/.updated |
	rg -v ^/etc/ca-certificates/ |
	rg -v ^/etc/fonts/conf.d/ |
	rg -v ^/etc/ssh/ssh_host_ |
	rg -v ^/etc/ssl/ |
	rg -v ^/etc/NetworkManager/system-connections/ |
	rg -v ^/etc/systemd/.+\.wants |
	rg -v ^/usr/share/mime/ |
	rg -v ^/var/cache/fontconfig/ |
	rg -v ^/var/cache/man/ |
	rg -v ^/var/cache/pacman/ |
	rg -v ^/var/lib/flatpak |
	rg -v ^/var/lib/pacman/local |
	rg -v ^/var/lib/pacman/sync |
	rg -v ^/var/log/journal/ \
		>/tmp/lostfiles.txt
