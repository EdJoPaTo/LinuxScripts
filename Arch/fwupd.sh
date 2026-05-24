#!/usr/bin/env sh
set -eux

pacman -S --needed --asdeps fwupd udisks2

fwupdmgr get-updates --assume-yes

fwupdmgr update
