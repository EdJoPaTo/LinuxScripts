# Arch Linux Specific

alias open='xdg-open'

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

alias yay='nice yay'
