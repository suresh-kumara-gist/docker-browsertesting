Test your code in a headless browser.
=====

[![CircleCI](https://circleci.com/gh/dcycle/docker-browsertesting/tree/2.svg?style=svg)](https://circleci.com/gh/dcycle/docker-browsertesting/tree/2)

Technologies
-----

* Branch 2 (**this branch**): Chrome Headless, Chromeless, Mocha and Chai.
* [Branch 1 (legacy)](https://github.com/dcycle/docker-browsertesting/tree/1): PhantomJS and Casper.

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

    cd ./example02 && ./build-sample-app.sh && cd ..
    docker run -v "$(pwd)"/example02/test:/app/test \
      -v "$(pwd)"/artifacts:/artifacts \
      --network myapp-network \
      dcycle/browsertesting:2 test/test.js

Resources:

* [This image on the Docker hub](https://hub.docker.com/r/dcycle/browsertesting/).
