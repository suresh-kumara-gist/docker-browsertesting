# See
#  http://thejsguy.com/2015/02/28/end-to-end-testing-with-phantomsjs-and-casperjs.html
# See https://github.com/Medium/phantomjs/issues/707 on why we are using
# node 7
FROM node:7

RUN mkdir -p /app/code

RUN cd /app && npm install phantomjs-prebuilt -g
RUN cd /app && npm install casperjs -g

WORKDIR /app

ENTRYPOINT [ "casperjs", "test" ]
