# Arch Linux Specific

# make AUR packages with all processor cores
# https://wiki.archlinux.org/index.php/Makepkg#Parallel_compilation
export MAKEFLAGS="-j$(nproc)"

alias setup-ros-melodic='source /opt/ros/melodic/setup.zsh'
