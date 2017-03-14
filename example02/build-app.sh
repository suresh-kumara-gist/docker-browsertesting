set -e

docker kill myapp || true
docker rm myapp || true
docker build -t myapp .
docker run -d -p 80 --name myapp myapp

echo -e "We created a sample app in the container myapp. Its internal port"
echo -e "is 80, but we mapped it to a random port on your computer:"
echo -e ""
echo -e " => $(docker port myapp)"
echo -e ""
echo -e "If you want to visit the app in your browser, go to the above port and"
echo -e "visit the path /todomvc/examples/angularjs. When we link this app to"
echo -e "dcycle/browsertesting, that container will access myapp at port 80,"
echo -e "which is why ./example02/test/test.js calls the 'To Do' app at"
echo -e "http://myapp/todomvc/examples/angularjs."
