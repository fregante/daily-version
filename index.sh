#! /bin/bash

mkdir -p ~/.npm-daily-version/

CURR=$(date -u +%y.%-m.%-d)
PREV=$(cat ~/.npm-daily-version/v 2>/dev/null || true)

if [[ $PREV =~ ^$CURR ]]; then
	CURR=$(date -u +%y.%-m.%-d.%-H%M)
fi

echo "$CURR" > ~/.npm-daily-version/v
echo "$CURR"
