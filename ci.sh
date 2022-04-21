#!/bin/sh
#
# Run continuous integration script on CircleCI.
# See also ./.circleci/config.yml.
#
set -e

echo '=> Build the image locally and test'
./test-after-building-image.sh

echo '=> Fail if a selector is not found.'
docker run --rm \
  -v "$(pwd)"/example01/selector-not-present-example:/app/test \
  local-browsertesting test/*.js && FAIL=0 || FAIL=1
if [ $FAIL == 0 ]; then
  echo 'Previous call was expected to fail but did not'
  exit 1
else
  echo 'Previous call failed as expected'
fi

echo '=> Fail if a chai assertion fails.'
docker run --rm \
  -v "$(pwd)"/example01/failing-test-example:/app/test \
  local-browsertesting test/*.js && FAIL=0 || FAIL=1
if [ $FAIL == 0 ]; then
  echo 'Previous call was expected to fail but did not'
  exit 1
else
  echo 'Previous call failed as expected'
fi

echo '=> Testing complete!'
