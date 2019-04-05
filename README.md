Test your code in a headless browser.
=====

[![CircleCI](https://circleci.com/gh/dcycle/docker-browsertesting/tree/3.svg?style=svg)](https://circleci.com/gh/dcycle/docker-browsertesting/tree/3)

Technologies
-----

* Branch 3 (**this branch**): Chrome Headless, Puppeteer, Mocha and Chai.
* [Branch 2 (legacy)](https://github.com/dcycle/docker-browsertesting/tree/2): Chrome Headless, Chromeless, Mocha and Chai.
* [Branch 1 (legacy)](https://github.com/dcycle/docker-browsertesting/tree/1): PhantomJS and Casper.

Prerequisites
-----

* Docker.

Simple example
-----

This example makes sure it is possible to perform a search on Google.com.

    docker run --rm -v "$(pwd)"/example01/test:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      dcycle/browsertesting:3

Example with your own app
-----

This second example builds a "to do" app in a Docker container, then runs tests
against it.

    cd ./example02 && ./build-sample-app.sh && cd ..
    docker run --rm -v "$(pwd)"/example02/test:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      --network myapp-network \
      dcycle/browsertesting:3 test/test.js

Other examples
-----

    docker run --rm -v "$(pwd)"/example01/failing-test-example:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      dcycle/browsertesting:3

    docker run --rm -v "$(pwd)"/example01/passing-test-example:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      dcycle/browsertesting:3

    docker run --rm -v "$(pwd)"/example01/selector-not-present-example:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      dcycle/browsertesting:3

Resources:
-----

* [This image on the Docker hub](https://hub.docker.com/r/dcycle/browsertesting/).
