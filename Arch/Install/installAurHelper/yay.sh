#!/usr/bin/sh
set -e

./installaurpackage.sh yay-bin

yay --gendb

yay --save --batchinstall --combinedupgrade --noremovemake --nodiffmenu --sudoloop
