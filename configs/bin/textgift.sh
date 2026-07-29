#!/usr/bin/env bash
set -eu -o pipefail

textgift=(
	'aber'
	'auch mal'
	'durchaus'
	'echt'
	'einfach'
	'halt'
	'irgendwann'
	'irgendwie'
	'irgendwo'
	'man'
	'natürlich'
	'nun'
	'nämlich'
	'wirklich'
	'wohl'
	'ziemlich'
)

args=()
for arg in "${textgift[@]}"; do
	args+=('-e' "$arg")
done

exec rg --word-regexp --ignore-case --sort path --stats \
	--type markdown \
	--type tex \
	--type txt \
	--type-add 'fluentde:de.ftl' --type fluentde \
	"${args[@]}"
