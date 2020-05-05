#!/usr/bin/sh
set -e

helper="yay"
param="--noconfirm --needed -Sy"

$helper $param "$@"
