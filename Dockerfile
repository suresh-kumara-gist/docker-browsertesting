# See
# https://github.com/GoogleChrome/puppeteer
FROM node

RUN mkdir -p /app/code
WORKDIR /app
ADD docker-resources /scripts
ADD example01/test /app/test

# We need to install a bunch of dependencies to avoid errors when
# Chromium is run.
RUN cd /app && npm install puppeteer && \
  npm install mocha chai && \
  mkdir /artifacts && \
  apt-get -y update && \
  apt-get --no-install-recommends -y install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 libdrm2 libgbm1 libxshmfence1 lsb-release xdg-utils wget && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/scripts/run-tests.sh" ]
