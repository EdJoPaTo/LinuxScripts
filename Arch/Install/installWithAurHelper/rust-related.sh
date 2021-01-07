#!/usr/bin/sh
set -e

# minimal cargo packages
./installWithAurHelper.sh cargo-diet

# analyze dependencies
./installWithAurHelper.sh cargo-geiger cargo-license
