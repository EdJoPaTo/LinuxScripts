#!/usr/bin/env bash

# When used as a cargo subcommand the first argument is the subcommand which should be removed
if [[ -n $1 ]] && [[ "$0" == *"$1" ]]; then
	shift 1
fi

shopt -s expand_aliases
alias rgrs='rg --glob "*.rs" --case-sensitive --no-heading --trim'

set -ux

cargo +nightly fmt --check

rg --glob '*.rs' --case-sensitive --files-with-matches --multiline 'mod .+;[\s\S]*\n(?:pub )?use .+;' && echo 'Put imports before module declarations. See https://doc.rust-lang.org/stable/style-guide/items.html'
rgrs 'Result<.+, String>' && echo 'Use proper error type'
rgrs 'Result<.+, \S*io::Error>' && echo 'Prefer io::Result as it results in easier to read docs'
rgrs 'use .+\WResult\W' && echo 'Dont import Result / override default prelude'
rgrs 'prelude::' && echo 'Dont use prelude as its hard to read where stuff is from'
rg --glob Cargo.toml --quiet anyhow && rgrs '\{err(or)?(:\?)?\}' && echo 'prefer {error:#} with anyhow'

nice cargo clippy --all-targets --keep-going "$@"

nice cargo doc --no-deps "$@"

# nice cargo build --all-targets --keep-going "$@"
nice cargo test --quiet --no-fail-fast "$@"
