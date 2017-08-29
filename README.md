# daily-version [![Build Status](https://travis-ci.org/bfred-it/daily-version.svg?branch=master)](https://travis-ci.org/bfred-it/daily-version)

> Get the current date formatted as a version. Automatically add the time if you already released a version today.

This command line tool can be used to version your nightly builds while still allowing hot patches to have their own version number. **`daily-version` is meant to be used on CI** as it automatically caches **one** version, globally.


## Install

```
$ npm install --save daily-version
```


## Usage

```sh
$ daily-version
17.8.29

$ daily-version
17.8.29.1451
```

For example, it can be used to set the version of a Web Extension in a Travis cronjob:

```yml
cache:
  directories:
  - $HOME/.npm-daily-version # This is necessary to preserve the version

script:
 - dot-json manifest.json version $(daily-version)
 - webstore upload --auto-publish
```


## License

MIT © [Federico Brigante](http://twitter.com/bfred_it)

