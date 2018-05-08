#!/bin/bash
#
# Test using image hosted on docker hub.
#
# This is what you might do on your own project.
#
set -e

echo '=> Build the sample app'
(cd ./example02 && ./build-sample-app.sh)

docker run -v "$(pwd)"/example01/test:/app/test \
  -v "$(pwd)"/artifacts:/artifacts \
  dcycle/browsertesting:2 test/*.js

docker run -v "$(pwd)"/example02/test:/app/test \
  -v "$(pwd)"/artifacts:/artifacts \
  --network myapp-network \
  dcycle/browsertesting:2 test/*.js

echo '=> Destroy the sample app'
(cd ./example02 && ./destroy-sample-app.sh)
