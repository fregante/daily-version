# daily-version [![Build Status](https://travis-ci.org/bfred-it/daily-version.svg?branch=master)](https://travis-ci.org/bfred-it/daily-version)

> Get the current date formatted as a version. Automatically add the time if you already released a version today.

This command line tool can be used to version your nightly builds while still allowing hot patches to have their own version number. **`daily-version` is meant to be used on CI** as it automatically caches **one** version, globally.


## Install

```
$ npm install --save daily-version
```


## Usage

`daily-version` needs to be called with a [keyvalue.xyz](https://keyvalue.xyz/) ID as its first parameter:

```sh
$ daily-version a17766c6
17.8.29

$ daily-version a17766c6
17.8.29.1451
```

To get this ID, run this command on your machine:

```sh
curl -X POST https://api.keyvalue.xyz/new/npm-daily-version
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
        "update-version": "dot-json manifest.json version $(daily-version a17766c6)"

        // https://github.com/DrewML/chrome-webstore-upload-cli/
        "upload": "webstore upload --auto-publish"
    }
}
```


## License

MIT © [Federico Brigante](http://twitter.com/bfred_it)

