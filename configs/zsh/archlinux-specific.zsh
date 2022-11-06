# Arch Linux Specific
if [[ $OSTYPE = linux* ]]; then

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

export MANPAGER=most

fi
