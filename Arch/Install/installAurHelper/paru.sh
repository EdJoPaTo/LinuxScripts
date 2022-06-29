#!/usr/bin/env bash
set -eu

./installaurpackage.sh paru-bin

paru --gendb
