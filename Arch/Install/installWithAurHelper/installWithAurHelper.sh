#!/usr/bin/sh
set -e

nice yay --noconfirm --needed --nocleanmenu --sudoloop -Sy "$@"
