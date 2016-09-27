#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param gnome-shell-system-monitor-applet-git gnome-shell-extension-remove-dropdown-arrows-git gnome-shell-extension-caffeine-git gnome-shell-extension-topicons-plus-git

