#! /bin/bash

mkdir -p ~/.version-store/

CURR=$(date -u +%y.%-m.%-d)
PREV=$(cat ~/.version-store/v 2>/dev/null || true)

if [[ $PREV =~ ^$CURR ]]; then
	CURR=$(date -u +%y.%-m.%-d.%-H%M)
fi

echo "$CURR" > ~/.version-store/v
echo "$CURR"
