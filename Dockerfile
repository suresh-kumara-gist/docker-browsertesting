# See
# https://github.com/GoogleChrome/puppeteer
FROM node

WORKDIR /app
ADD docker-resources /scripts
ADD example01/test /app/test

# # https://github.com/puppeteer/puppeteer/issues/7740#issuecomment-970490323
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# We need to install a bunch of dependencies to avoid errors when
# Chromium is run. On ARM we need to install Chromium first, _then_
# puppeteer etc.
# https://github.com/puppeteer/puppeteer/issues/7740#issuecomment-970490323
RUN mkdir -p /app/code &&\
  cd /app && \
  apt-get -y update && \
  apt-get --no-install-recommends -y install chromium && \
  npm install puppeteer && \
  npm install mocha chai && \
  mkdir /artifacts && \
  apt-get --no-install-recommends -y install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libnss3 libdrm2 libgbm1 libxshmfence1 lsb-release xdg-utils wget && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/scripts/run-tests.sh" ]
