#!/usr/bin/env sh
set -eu

for file in bin/*; do
	chmod +x "$file"
	filename=$(basename "$file")
	sudo cp "$file" "$HOME/.local/bin/${filename%.*}"
done
