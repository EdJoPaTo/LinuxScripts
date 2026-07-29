#!/usr/bin/env bash
set -eu -o pipefail

host='.hostnames.hostname["@name"]'
ipv4='.address|arrays|map(select(.["@addrtype"] == "ipv4"))|map(.["@addr"])[]'
vendor='.address|arrays|map(.["@vendor"]|strings)[]'

sudo nmap -sn -oX - "$@" |
	xq '.nmaprun.host[]' |
	jq -r "[ ($host), ($ipv4), ($vendor) ] | @tsv" |
	column -t -s$'\t' |
	sort
