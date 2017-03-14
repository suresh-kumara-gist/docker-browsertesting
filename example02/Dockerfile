# This is an app for demonstration purposes. It is a simple to do list.
FROM httpd

RUN apt-get update -y
RUN apt-get install git -y
RUN cd /usr/local/apache2/htdocs/ && git clone https://github.com/tastejs/todomvc
