#!/usr/bin/env bash
set -eu -o pipefail

echo "explicit:     $(pacman -Qqe | wc -l)"
echo "dependencies: $(pacman -Qqd | wc -l)"

echo
echo "# optional dependencies"
pacman -Qqdttn

echo
echo "# explicitly installed and required by another package"
pacman -Qqen | grep -Fxvf <(pacman -Qqtt)
