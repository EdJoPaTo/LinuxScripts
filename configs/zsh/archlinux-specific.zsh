# Arch Linux Specific
if [[ $OSTYPE = linux* ]]; then

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

# fix ssh key stuff with gnome-keyring
export SSH_AUTH_SOCK=/run/user/$(id --user)/keyring/ssh

fi
