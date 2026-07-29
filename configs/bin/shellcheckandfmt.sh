#!/usr/bin/env sh
set -u

shellcheck "$@"
shfmt --diff "$@"

rg --glob '*.sh' '^function'
rg --glob '*.sh' '\$\(pwd\)'
