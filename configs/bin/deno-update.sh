#!/usr/bin/env sh

rm -rf deno.lock
fd --extension=ts --exec-batch deno cache --reload

exec deno-pedantic
