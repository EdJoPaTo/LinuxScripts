#!/usr/bin/env bash
set -eu -o pipefail

chmod +x bin/*
sudo cp bin/* /usr/local/bin/
