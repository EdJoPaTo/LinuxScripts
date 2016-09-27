#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param zsh zsh-completions oh-my-zsh-git

echo THEME: bureau

