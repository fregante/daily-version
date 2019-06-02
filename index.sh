#! /bin/bash

YEAR=${1:-y}
CURR=$(date -u +%"$YEAR".%-m.%-d)

# Check if there's already a tag for today
if [ "$(git tag -l "$CURR")" ]; then
	utc-version
else
	echo "$CURR"
fi

