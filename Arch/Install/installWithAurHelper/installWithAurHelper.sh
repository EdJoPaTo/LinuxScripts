#!/usr/bin/sh
set -e

nice paru --batchinstall --sudoloop --noconfirm --needed -Sy "$@"
