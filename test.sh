#!/bin/bash
set -e

docker kill local-browsertesting || true
docker rm local-browsertesting || true

docker build -t local-browsertesting .

BASE="$(pwd)"

cd "$BASE"/example02 && ./build-app.sh
cd "$BASE"

docker run -v "$(pwd)"/example01/test:/app/test \
  local-browsertesting test/*.js

docker run -v "$(pwd)"/example02/test:/app/test \
  --link myapp:myapp \
  local-browsertesting test/*.js

docker run -v "$(pwd)"/example01/test:/app/test \
  dcycle/browsertesting:2 test/*.js

docker run -v "$(pwd)"/example02/test:/app/test \
  --link myapp:myapp \
  dcycle/browsertesting:2 test/*.js
