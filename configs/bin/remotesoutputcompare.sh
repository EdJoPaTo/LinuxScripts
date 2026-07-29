#!/usr/bin/env bash
set -eu -o pipefail

servera=$1
serverb=$2
shift 2
command=$(printf '%q ' "$@")

ssh -tt "$servera" -- "bash -cl -- '$command' 2>&1" >/tmp/remotesoutputcompare-"$servera".txt &
ssh -tt "$serverb" -- "bash -cl -- '$command' 2>&1" >/tmp/remotesoutputcompare-"$serverb".txt &

wait
exec difft /tmp/remotesoutputcompare-"$servera".txt /tmp/remotesoutputcompare-"$serverb".txt
