#!/bin/bash

yaourt -Sy
param="--noconfirm --needed -S"

yaourt $param numix-themes numix-circle-icon-theme-git # numix-icon-theme-git
