# Arch Linux Specific
if [[ $OSTYPE = linux* ]]; then

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

# fix ssh key stuff with gnome-keyring on sway
# requires systemctl --user enable --now gcr-ssh-agent.service
export SSH_AUTH_SOCK=/run/user/$(id --user)/gcr/ssh

fi
