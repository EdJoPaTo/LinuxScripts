#!/usr/bin/env bash
set -e

nice paru --sudo sudo --sudoloop --skipreview --noconfirm --needed -S "$@"
