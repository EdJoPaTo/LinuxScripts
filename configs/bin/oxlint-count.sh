#!/usr/bin/env bash
set -eu -o pipefail

./node_modules/.bin/oxlint "$@" --format=json |
	jq -r '.diagnostics | map(.code) | sort | .[]' |
	uniq -c |
	sort -h
