#!/usr/bin/env bash
set -eu -o pipefail

# usage: remoterun server command which should be executed
# usage: remoterun my.server.tld cargo build

server=$1
shift 1
command=$(printf '%q ' "$@")

base=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
relative=$(git rev-parse --show-prefix 2>/dev/null || true)
relative=${relative:-"."}
basename=${base##*/}
remotebase=".cache/remoterun/$basename/"

rsync \
	--recursive --links --copy-unsafe-links --perms --times --omit-dir-times \
	--compress --verbose --checksum \
	--delete \
	--exclude-from="$HOME/.config/git/ignore" \
	--filter="- .git" \
	--filter="- .jj" \
	--filter="- .teamtype" \
	--filter=":C .gitignore" \
	--rsync-path="mkdir -p $remotebase && rsync" \
	"$base/" "$server:$remotebase"

set +e

ssh -ttq "$server" -- \
	"uptime && cd '$remotebase' && git init --quiet; cd '$relative' && exec bash -cl -- '$command'"

exitcode="$?"
ssh "$server" uptime
exit $exitcode
