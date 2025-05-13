#!/usr/bin/env bash
set -eu -o pipefail

EXPLICIT=(
	bat
	fd-find
	fish
	htop
	neovim
	ripgrep
	shellcheck
)

apt-get update
apt-get install -y "${EXPLICIT[@]}"

ln --symbolic --force /usr/bin/batcat /usr/local/bin/bat
ln --symbolic --force /usr/bin/fdfind /usr/local/bin/fd
