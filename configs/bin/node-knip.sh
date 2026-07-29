#!/usr/bin/env bash
set -eu

git diff --quiet || (echo "repo unclean. stage or commit first" && exit 1)

set -eu -o pipefail

nice npm install --no-audit --no-fund --no-save knip@latest

name=$(basename "$PWD")
cat <<EOF >.knip.jsonc
{
	"\$schema": "https://unpkg.com/knip@4/schema.json",
	"entry": [
		"examples/*.ts",
		"test/**/*.ts",
		"source/**/*.test.ts",
		"source/**/test.ts",
		"source/index.ts",
		"source/mod.ts",
		"source/$name.ts"
	],
	"project": [
		"**/*.{js,ts,tsx}"
	]
}
EOF

nice ./node_modules/.bin/knip --fix --no-exit-code
rm .knip.jsonc

exec nice npm test
