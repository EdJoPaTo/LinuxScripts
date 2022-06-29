#!/usr/bin/env bash
set -eux

flatpak remote-add --user --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo

flatpak install --user gnome-nightly org.gnome.Fractal.Devel
