#!/bin/bash

HEAD=$1
TODAY=$(utc-version --short)

# Check if there's already a tag for today
if [ "$(git tag -l "$HEAD$TODAY")" ]; then
	echo "$HEAD$(utc-version)"
else
	echo "$TODAY"
fi
