#!/usr/bin/env sh
set -eux

pacman -S --needed --asdeps fwupd

fwupdmgr get-updates --assume-yes

fwupdmgr update
