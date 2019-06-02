# daily-version [![Build Status](https://travis-ci.org/bfred-it/daily-version.svg?branch=master)](https://travis-ci.org/bfred-it/daily-version)

> Get the current date formatted as a version. Automatically add the time if there's already a git tag for today's version.

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
```

### Travis

For example, it can be used to set the version of a Web Extension in a Travis cronjob:

```yml
# travis.yml
deploy:
  provider: script
  script: npm run update-version && npm run upload
  on:
    condition: $TRAVIS_EVENT_TYPE = cron
```

```js
// package.json
{
    "scripts": {
        // https://github.com/maikelvl/dot-json
        "update-version": "dot-json manifest.json version $(daily-version)"

        // https://github.com/DrewML/chrome-webstore-upload-cli/
        "upload": "webstore upload --auto-publish"
    }
}
```


## License

MIT © [Federico Brigante](http://twitter.com/bfred_it)

