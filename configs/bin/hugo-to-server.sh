#!/usr/bin/env sh
set -eu

folder=${PWD##*/}

# rm -rf public
hugo --cleanDestinationDir
rsync \
	--checksum \
	--compress \
	--delay-updates \
	--delete-delay \
	--exclude=.DS_Store \
	--perms \
	--recursive \
	--verbose \
	public/ xmas2014.3t0.de:"/var/www/$folder/" |
	rg -v '^tags/' |
	rg -v '^categories/' |
	rg -v 'page/\d+'
