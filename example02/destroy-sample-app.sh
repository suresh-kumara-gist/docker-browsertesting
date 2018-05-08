set -e

APPNAME=myapp

echo '=> Sample app: stopping existing container if there is one'
./lib/stop-existing-container.sh

echo '=> Sample app: destroy network if it exists'
docker network ls|grep "$APPNAME"-network && \
  docker network rm "$APPNAME"-network
