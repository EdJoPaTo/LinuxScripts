#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param numix-gtk-theme numix-circle-icon-theme-git # numix-icon-theme-git
