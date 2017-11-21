# See
# https://github.com/graphcool/chromeless
FROM node

RUN mkdir -p /app/code

RUN cd /app && npm install chromeless

# Install Chrome 60 or higher
# See https://askubuntu.com/questions/510056
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update
RUN apt-get -y install google-chrome-stable
RUN ln -s /opt/google/chrome/chrome /bin/chrome

WORKDIR /app
RUN npm install mocha chai

ADD docker-resources /scripts
ADD example01/test /app/test
RUN mkdir /artifacts

ENTRYPOINT [ "/scripts/run-tests.sh" ]
