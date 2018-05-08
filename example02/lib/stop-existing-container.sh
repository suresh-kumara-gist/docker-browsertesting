set -e

APPNAME=myapp

docker ps|grep "$APPNAME"-container && \
  (docker stop "$APPNAME"-container; \
  docker rm "$APPNAME"-container;) ||
  echo "(no existing container $APPNAME-container)"
