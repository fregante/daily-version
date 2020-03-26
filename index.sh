#!/bin/bash

PREFIX=$1
TODAY=$(npx utc-version --short)

# Check if there's already a tag for today
if [ "$(git tag -l "$PREFIX$TODAY")" ]; then
	echo "$PREFIX$(npx utc-version)"
else
	echo "$PREFIX$TODAY"
fi
