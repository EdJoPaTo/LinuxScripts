#!/usr/bin/sh
set -e

# see pinned comments https://aur.archlinux.org/packages/ignition-math
./installWithAurHelper.sh --asdeps swig-git

# apply manually to ignition-math: https://github.com/ignitionrobotics/ign-math/commit/fdbd226d70885e85e265d7c61cfa9014bee1a33a
# the easiest way for me was to simply edit the PKGBUILD and add a bash command. When entering that bash edit that file and exit bash
#./installWithAurHelper.sh --asdeps ignition-math

./installWithAurHelper.sh --asdeps ros-build-tools-py3
./installWithAurHelper.sh ros-melodic-desktop-full

sudo rm /etc/ros/rosdep/sources.list.d/20-default.list
sudo rosdep init
rosdep update
