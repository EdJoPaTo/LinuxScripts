#!/usr/bin/env sh

deno fmt --check
deno lint
deno test -A # --permission-set
fd --extension=ts --exec-batch deno check
