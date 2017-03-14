# See
#  http://thejsguy.com/2015/02/28/end-to-end-testing-with-phantomsjs-and-casperjs.html
FROM node

RUN mkdir -p /app/code

RUN cd /app && npm install phantomjs -g
RUN cd /app && npm install casperjs -g

WORKDIR /app

ENTRYPOINT [ "casperjs", "test" ]
