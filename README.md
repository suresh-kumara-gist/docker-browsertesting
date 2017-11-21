Test your code in a headless browser.
=====

[![CircleCI](https://circleci.com/gh/dcycle/docker-browsertesting.svg?style=svg)](https://circleci.com/gh/dcycle/docker-browsertesting)

Technologies
-----

 * [PhantomJS](http://phantomjs.org), a headless browser.
 * [Casper](http://casperjs.org), the testing framework.

Prerequisites
-----

 * Docker.

Simple example
-----

This example makes sure it is possible to perform a search on Google.com.

    docker run -v "$(pwd)"/example01/test:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      dcycle/browsertesting:2

Example with your own app
-----

This second example builds a "to do" app in a Docker container, then runs tests
against it.

    cd ./example02 && ./build-app.sh && cd ..
    docker run -v "$(pwd)"/example02/test:/app/code \
      --link myapp:myapp \
      dcycle/browsertesting code/test.js

Resources:

 * [End To End Testing with PhantomJS and CasperJS, David Tang, February 28th, 2015, The JS Guy](http://thejsguy.com/2015/02/28/end-to-end-testing-with-phantomsjs-and-casperjs.html).
 * [This image on the Docker hub](https://hub.docker.com/r/dcycle/browsertesting/).
