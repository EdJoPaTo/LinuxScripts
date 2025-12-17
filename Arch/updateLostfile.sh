#!/usr/bin/env bash
set -eu -o pipefail

sudo lostfiles -s |
	rg -v /\.updated$ |
	rg -v /texmf |
	rg -v ^/boot/initramfs |
	rg -v ^/etc/NetworkManager/system-connections/ |
	rg -v ^/etc/ca-certificates/ |
	rg -v ^/etc/doas.conf$ |
	rg -v ^/etc/fonts/conf.d/ |
	rg -v ^/etc/hostname$ |
	rg -v ^/etc/locale.conf$ |
	rg -v ^/etc/machine-id$ |
	rg -v ^/etc/os-release$ |
	rg -v ^/etc/pacman.d/gnupg |
	rg -v ^/etc/ssh/ssh_host_ |
	rg -v ^/etc/ssl/ |
	rg -v ^/etc/systemd/.+\.wants |
	rg -v ^/etc/vconsole.conf$ |
	rg -v ^/usr/lib/ghc- |
	rg -v ^/usr/share/mime/ |
	rg -v ^/var/cache/fontconfig/ |
	rg -v ^/var/cache/man/ |
	rg -v ^/var/cache/pacman/ |
	rg -v ^/var/lib/NetworkManager/ |
	rg -v ^/var/lib/flatpak |
	rg -v ^/var/lib/gdm/ |
	rg -v ^/var/lib/pacman/local |
	rg -v ^/var/lib/pacman/sync |
	rg -v ^/var/lib/systemd/timers/ |
	rg -v ^/var/log/journal/ |
	rg -v ^/var/tmp/flatpak-cache- |
	rg -v ^/var/tmp/systemd-private- \
		>/tmp/lostfiles.txt

exec less /tmp/lostfiles.txt
