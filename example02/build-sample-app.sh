set -e

APPNAME=myapp

echo '=> Sample app: create network if it does exist'
docker network ls|grep "$APPNAME"-network || \
  docker network create "$APPNAME"-network

echo '=> Sample app: build image from dockerfile'
docker build -t "$APPNAME"-image .

echo '=> Sample app: stopping existing container if there is one'
./lib/stop-existing-container.sh

echo '=> Sample app: create container with latest version of the image'
docker run --rm -d -p 80 --network "$APPNAME"-network --name "$APPNAME"-container "$APPNAME"-image

echo '=> Sample app: make sure container is connected to network'
docker inspect "$APPNAME"-container|grep "$APPNAME"-network >/dev/null && \
  echo "(container $APPNAME-container already connected to $APPNAME-network)" || \
  docker network connect "$APPNAME"-network "$APPNAME"-container

echo -e "We created a sample app in the container $APPNAME-container. Its internal port"
echo -e "is 80, but we mapped it to a random port on your computer:"
echo -e ""
echo -e " => $(docker port $APPNAME-container)"
echo -e ""
echo -e "If you want to visit the app in your browser, go to the above port and"
echo -e "visit the path /todomvc/examples/angularjs_require. When we link this app to"
echo -e "dcycle/browsertesting, that container will access $APPNAME-container at port 80,"
echo -e "which is why ./example02/test/test.js calls the 'To Do' app at"
echo -e "http://$APPNAME-container/todomvc/examples/angularjs_require."
