#!/usr/bin/sh
set -e

# see pinned comments https://aur.archlinux.org/packages/ignition-math
./installWithAurHelper.sh --asdeps swig-git

./installWithAurHelper.sh --asdeps ros-build-tools-py3
./installWithAurHelper.sh ros-melodic-desktop-full

sudo rm /etc/ros/rosdep/sources.list.d/20-default.list
sudo rosdep init
rosdep update
