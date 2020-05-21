#!/bin/zsh
mkdir -p "$HOME/.zsh"
mkdir -p "$HOME/.cache"

# verbose relative symbolic force
# remove r on macOS
lnoptions="-vrsf"

ln $lnoptions "$(pwd)/zshrc" "$HOME/.zshrc"

for config_file ($(pwd)/*.zsh); do
    ln $lnoptions $config_file "$HOME/.zsh"
done

git clone --depth=1 https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
