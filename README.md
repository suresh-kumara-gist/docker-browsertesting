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

Resources:
-----

* [This image on the Docker hub](https://hub.docker.com/r/dcycle/browsertesting/).


Migrating from tag 4 to tag 5:
-----

* Inorder to Migrate chai5 from chai4.
```
In ./docker-resources/build-docker.sh, change this line:
npm install mocha chai@4
for this one:
npm install mocha chai
This has the effect of using version 5 of chai instead of version 4.
```
* The headline change in Chai 5 is ESM.
* To compile js to es6 we need to put { "type" : "module" } in package.json
or else we need to modify file extension to .mjs.
* [es6 features](https://www.w3schools.com/js/js_es6.asp)
* this.timeout(15000) throws error if we put it inside arrow function.
Hence shouldn't use arrow in that context.
```
it('It should be possible to search for something on Google', async function() {
  this.timeout(15000);
})
```