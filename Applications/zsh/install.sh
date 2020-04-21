#!/bin/sh
mkdir -p "$HOME/.zsh"
mkdir -p "$HOME/.cache"

mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
cat zshrc > "$HOME/.zshrc"
cat *.zsh >> "$HOME/.zshrc"

git clone --depth=1 https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
