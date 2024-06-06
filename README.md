Test your website in a headless browser.
=====

[![CircleCI](https://circleci.com/gh/dcycle/docker-browsertesting/tree/master.svg?style=svg)](https://circleci.com/gh/dcycle/docker-browsertesting/tree/master)

Technologies
-----

Test any website using Chrome Headless, Puppeteer, Mocha and Chai.

Prerequisites
-----

* Docker.

Simple example
-----

This example makes sure it is possible to perform a search on Google.com.

    docker run --rm -v "$(pwd)"/example01/test:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      dcycle/browsertesting:4

Example with your own app
-----

This second example builds a "to do" app in a Docker container, then runs tests
against it.

    cd ./example02 && ./build-sample-app.sh && cd ..
    docker run --rm -v "$(pwd)"/example02/test:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      --network myapp-network \
      dcycle/browsertesting:4 test/test.js

Other examples
-----

    docker run --rm -v "$(pwd)"/example01/failing-test-example:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      dcycle/browsertesting:4

    docker run --rm -v "$(pwd)"/example01/passing-test-example:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      dcycle/browsertesting:4

    docker run --rm -v "$(pwd)"/example01/selector-not-present-example:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      dcycle/browsertesting:4

Resources
-----

* [This image on the Docker hub](https://hub.docker.com/r/dcycle/browsertesting/).

Version history
-----

* Version 5 uses [Chai](https://www.chaijs.com) 5 and introduces breaking changes from version 4 (see "Migrating from tag 4 to tag 5", below)
* Version 4 uses Chai 4 and is deprecated, so you are encouraged to migrate to tag 5 of this project.


Migrating from tag 4 to tag 5
-----

* this.timeout(15000) throws error if we put it inside arrow function.
Hence shouldn't use arrow in that context, Use function syntax as shown below example. 
```
it('It should be possible to search for something on Google', async function() {
  this.timeout(15000);
})
```
* Your test files should have the extension .mjs rather than .js 
* Instead of `const { expect } = require('chai')`, use `import { expect } from 'chai';`
* Follow es6 js coding standard in your code.. [es6 features](https://www.w3schools.com/js/js_es6.asp).
* See [this pull request](https://github.com/dcycle/docker-browsertesting/pull/18/files) for an example of how to migrate your test files from tag 4 to 5
