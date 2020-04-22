#!/bin/sh
mkdir -p "$HOME/.zsh"
mkdir -p "$HOME/.cache"

# verbose relative symbolic force
lnoptions="-vrsf"

ln $lnoptions zshrc "$HOME/.zshrc"
ln $lnoptions *.zsh "$HOME/.zsh"
# cp -v *.zsh "$HOME/.zsh"

git clone --depth=1 https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
