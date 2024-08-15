#!/usr/bin/env bash

# When used as a cargo subcommand the first argument is the subcommand which should be removed
if [[ -n $1 ]] && [[ "$0" == *"$1" ]]; then
	shift 1
fi

set -eu -o pipefail

cargo-pedantic "$@" --message-format=json |
	jq -r '.message.code.code | select(.)' |
	sort |
	uniq -c |
	sort -h
