#!/bin/bash
#
# This is the entrypoint to the container.
# We need to start Chrome in the background, then run our tests.
# Once this script exists, the container will be destroyed.
#
echo -e '[info] Starting chrome in the background.'
# https://unix.stackexchange.com/questions/103731
/scripts/start-chrome.sh > output.log 2>&1 &
echo -e '[info] Running all tests with mocha in /app/test/*.js'
/app/node_modules/mocha/bin/mocha test/*.js
echo -e '[info] Move screenshots from /tmp to /artifacts'
mv /tmp/*png /artifacts
