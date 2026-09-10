#!/usr/bin/env sh

base=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
basename=${base##*/}
DENO_COVERAGE_DIR="/tmp/deno-coverage-$USER-$basename/"

deno fmt --check
deno lint
deno test --reporter=dot --clean --coverage="$DENO_COVERAGE_DIR" --doc -A # --permission-set
fd --extension=ts --exec-batch deno check
