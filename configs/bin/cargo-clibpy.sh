#!/usr/bin/env bash

# Run additionally to cargo-pedantic for libraries

# When used as a cargo subcommand the first argument is the subcommand which should be removed
if [[ -n $1 ]] && [[ "$0" == *"$1" ]]; then
	shift 1
fi

set -eu -o pipefail

nice cargo clippy "$@" -- \
	-W clippy::allow_attributes \
	-W clippy::allow_attributes_without_reason \
	-W clippy::arithmetic_side_effects \
	-W clippy::exhaustive_enums \
	-W clippy::indexing_slicing \
	-W clippy::infinite_loop \
	-W clippy::integer_division \
	-W clippy::let_underscore_must_use \
	-W clippy::panic \
	-W clippy::std_instead_of_core \
	-W clippy::unwrap_in_result \
	-W clippy::unwrap_used \
	-W clippy::use_debug \
	-W unnameable_types \
	-W clippy::cargo \
	-A clippy::multiple_crate_versions

nice cargo rustdoc --keep-going --lib "$@" -- \
	-W rustdoc::missing_crate_level_docs \
	-W rustdoc::private_doc_tests \
	-W rustdoc::unescaped_backticks \
	-W missing_docs
