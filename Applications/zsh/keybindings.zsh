# Keybindings
# cat -v to find the key
# zle -la to find Zsh Line Editor commands

# Use Emacs as basic
bindkey -e

# Up Down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Home/Pos1 End (Linux & macOS via Fn Left/Right)
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line

# Control Left/Right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Delete/Entf
bindkey '^[[3~' delete-char
