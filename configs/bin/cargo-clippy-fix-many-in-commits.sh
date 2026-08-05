#!/usr/bin/env bash

# This script helps with migrating a Rust crate to a set of clippy lint groups.
# First enable the group via Cargo.toml, then also allow all the lints that create warnings (cargo clippy-count).
# Then run this script with -- -W clippy::lintgroup
# It will remove each MachineApplicable lint one by one and fix it.
# If some lint still creates some warnings afterward it will be skipped.

# When used as a cargo subcommand the first argument is the subcommand which should be removed
if [[ -n $1 ]] && [[ "$0" == *"$1" ]]; then
	shift 1
fi

set -eu -o pipefail

# ensure it currently has no warnings
cargo +nightly fmt --check
cargo clippy --workspace --all-targets --all-features       -- -Dwarnings
cargo clippy --workspace --all-targets                      -- -Dwarnings
cargo clippy --workspace --lib --bins --no-default-features -- -Dwarnings

lints=$(cargo clippy --keep-going --workspace --all-targets --all-features --message-format=json "$@" |
	jq -r '.message | select(.children[]?.spans[]?.suggestion_applicability == "MachineApplicable") | .code.code | select(.)' |
	sort -h |
	uniq)

echo "$lints"

apply_lint() {
	set -eu -o pipefail
	lint="$1"

	sed -i "/^${lint#clippy::}/d" Cargo.toml
	git add Cargo.toml

	cargo clippy --workspace --all-targets --fix --allow-staged --all-features
	cargo clippy --workspace --all-targets --fix --allow-staged --allow-dirty
	cargo +nightly fmt
	cargo clippy --workspace --all-targets --all-features       -- -Dwarnings
	cargo clippy --workspace --all-targets                      -- -Dwarnings
	cargo clippy --workspace --lib --bins --no-default-features -- -Dwarnings

	git commit -am "$lint

https://rust-lang.github.io/rust-clippy/stable/index.html#${lint#clippy::}"
}

set +e
for lint in $lints; do
	printf "\n\n#\n##\n### %s\n" "$lint"

	# Run in a subshell so the set -e works without stopping this for loop
	(apply_lint "$lint")

	# cleanup the repo before continuing to the next one
	git reset --quiet
	git restore .
done

printf "\n\n#\n##\n### All done!\n"
