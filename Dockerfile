# See
# https://github.com/GoogleChrome/puppeteer
FROM node:alpine

WORKDIR /app

# # https://github.com/puppeteer/puppeteer/issues/7740#issuecomment-970490323
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

ADD docker-resources /scripts

RUN /scripts/build-docker.sh && rm /scripts/build-docker.sh

ENTRYPOINT [ "/scripts/run-tests.sh" ]
