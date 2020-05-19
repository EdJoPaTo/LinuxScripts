#!/usr/bin/sh
set -e

nice yay --noconfirm --needed --nodiffmenu --nocleanmenu -Sy "$@"
