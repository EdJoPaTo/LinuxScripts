#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param gnome-shell-extension-system-monitor-git gnome-shell-extension-remove-dropdown-arrows gnome-shell-extension-caffeine-git gnome-shell-extension-topicons-plus
