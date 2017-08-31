#! /bin/bash

ID=$1
YEAR=${2:-y}

# ID must be 8 letters long
if [[ ${#ID} -ne 8 ]] ; then
	echo 'You need to pass a keyvalue.xyz ID like:'
	echo '$ daily-version a17766c6'
	echo
	echo 'Get your own ID by running this command:'
	echo '$ curl -s -X POST https://api.keyvalue.xyz/new/npm-daily-version'
	exit 1
fi

CURR=$(date -u +%"$YEAR".%-m.%-d)
LAST=$(curl -s https://api.keyvalue.xyz/"$ID"/npm-daily-version)

# Check if the last version contains today's date
if [[ $LAST =~ ^$CURR ]]; then
	CURR=$(date -u +%"$YEAR".%-m.%-d.%-H%M)
fi

curl -s -X POST https://api.keyvalue.xyz/"$ID"/npm-daily-version/"$CURR"
echo "$CURR"
