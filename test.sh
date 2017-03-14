set -e

docker kill local-browsertesting || true
docker rm local-browsertesting || true

docker build -t local-browsertesting .

BASE="$(pwd)"

cd "$BASE"/example02 && ./build-app.sh
cd "$BASE"

docker run -v "$(pwd)"/example01/test:/app/code \
  local-browsertesting code/test.js

docker run -v "$(pwd)"/example02/test:/app/code \
  --link myapp:myapp \
  local-browsertesting code/test.js

docker run -v "$(pwd)"/example01/test:/app/code \
  dcycle/browsertesting code/test.js

docker run -v "$(pwd)"/example02/test:/app/code \
  --link myapp:myapp \
  dcycle/browsertesting code/test.js
