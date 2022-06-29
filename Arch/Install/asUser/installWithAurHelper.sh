#!/usr/bin/env bash
set -eu

nice paru --sudo sudo --sudoloop --skipreview --noconfirm --needed -Sy --asdeps "$@"
