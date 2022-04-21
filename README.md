Test your website in a headless browser.
=====

[![CircleCI](https://circleci.com/gh/dcycle/docker-browsertesting/tree/3.svg?style=svg)](https://circleci.com/gh/dcycle/docker-browsertesting/tree/3)

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
