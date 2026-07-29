#!/usr/bin/env sh
set -u

# deno cache --reload --no-lock --node-modules-dir=false npm:xo
# nice deno --no-lock --node-modules-dir=false -A npm:xo --version

cat <<EOF >.xo-config.json
{
	"rules": {
		"@typescript-eslint/quotes": ["error", "double"],
		"default-case": "warn",

		"@typescript-eslint/comma-dangle": "off",
		"@typescript-eslint/indent": "off",
		"@typescript-eslint/lines-between-class-members": "off",
		"@typescript-eslint/naming-convention": "off",
		"@typescript-eslint/no-unsafe-assignment": "off",
		"@typescript-eslint/no-unsafe-call": "off",
		"@typescript-eslint/no-unsafe-return": "off",
		"@typescript-eslint/non-nullable-type-assertion-style": "off",
		"@typescript-eslint/object-curly-spacing": "off",
		"@typescript-eslint/padding-line-between-statements": "off",
		"@typescript-eslint/promise-function-async": "off",
		"@typescript-eslint/restrict-template-expressions": "off",
		"arrow-parens": "off",
		"capitalized-comments": "off",
		"indent": "off",
		"n/file-extension-in-import": "off",
		"object-curly-newline": "off",
		"object-curly-spacing": "off",
		"operator-linebreak": "off",
		"quotes": "off",
		"semi-spacing": "off"
	}
}
EOF

nice deno \
	--allow-env --allow-read --allow-sys \
	--allow-write="$HOME/.xo-cache,./node_modules/.cache/xo-linter,../node_modules/.cache/xo-linter" \
	--no-lock --node-modules-dir=false \
	npm:xo "$@"
exit=$?

rm .xo-config.json
exit $exit
