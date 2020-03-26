# daily-version [![Build Status](https://travis-ci.org/fregante/daily-version.svg?branch=master)](https://travis-ci.org/fregante/daily-version)

> Get the current date formatted as a version. Automatically add the time if there’s already a git tag for today’s version.

`daily-version` can be used to version your daily/nightly builds while still allowing multiple versions each day.

## Install

```
$ npm install daily-version
```


## Usage

```sh
$ daily-version
17.8.29

$ git tag $(daily-version)
# Creates a tag named 17.8.29

$ daily-version
17.8.29.1451
# Detects the existing tag, and includes generates a sub-version based on the hours/seconds

$ daily-version v
v17.8.29.1451
# Lets you specify any prefix
```

### GitHub Actions

[This workflow](https://github.com/notlmn/browser-extension-template/blob/master/.github/workflows/deploy-automatic.yml) will create a new tag automatically, daily, using `daily-version`

```yml
# If new commits are available since the last tag, create a new version/tag
# - Every day at 15:15

name: Auto-tagger

on:
  schedule:
    - cron: '15 15 * * *'

jobs:
  create-version:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: fregante/setup-git-token@v1
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
      - run:
          git push --delete origin deploy
          if [[ $(git tag -l --points-at HEAD) = "" ]]; then
            export VER=$(npx daily-version)
            git tag $VER -m $VER
            git push origin $VER
          fi
```