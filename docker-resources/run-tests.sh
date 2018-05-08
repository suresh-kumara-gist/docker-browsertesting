#!/bin/bash
#
# This is the entrypoint to the container.
# We need to start Chrome in the background, then run our tests.
# Once this script exits, the container will be destroyed.
#
echo -e '[info] Starting chrome in the background.'
# https://unix.stackexchange.com/questions/103731
/scripts/start-chrome.sh > output.log 2>&1 &
echo -e '[info] Running all tests with mocha in /app/test/*.js'
# See https://stackoverflow.com/a/12451419/1207752
exec 5>&1
OUTPUT=$(/app/node_modules/mocha/bin/mocha test/*.js|tee >(cat - >&5))

# See https://stackoverflow.com/a/6364244/1207752.
echo -e '[info] Move screenshots from /tmp to /artifacts if applicable'
for f in /tmp/*.png; do
  [ -e "$f" ] && mv /tmp/*png /artifacts || echo "[info] No screenshots to move from /tmp to /artifacts"
  break
done

if [[ "$OUTPUT" = *"Exception alert"* ]]; then
  echo "Our output contains 'Exception alert'"
  echo "Exiting with 2"
  exit 2
elif [[ "$OUTPUT" = *"AssertionError"* ]]; then
  echo "Our output contains 'Exception alert'"
  echo "Exiting with 2"
  exit 1
else
  echo "Our output does not contain 'Exception alert'"
  echo "Will now exit with the Mocha exit code"
fi
