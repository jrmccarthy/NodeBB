FROM mhart/alpine-node

EXPOSE 4567

# Alpine packages we need
RUN apk add --no-cache git bash

RUN mkdir /app
WORKDIR /app

COPY install/package.json /app/package.json
RUN npm install && npm cache clean --force
COPY . /app

ENV NODE_ENV=production \
    daemon=false \
    silent=false

# Plugins!
# Stuff from npm:
RUN npm install nodebb-plugin-composer-default \
    nodebb-plugin-custom-pages \
    nodebb-plugin-dbsearch \
    nodebb-plugin-markdown \
    nodebb-plugin-mentions \
    nodebb-plugin-poll \
    nodebb-rewards-essentials \
    nodebb-widget-essentials

ENV url="http://127.0.0.1/4567" \
    secret="secret" \
    database="mongo" \
    mongo__host="mongodb" \
    mongo__database="nodebb" \
    mongo__username="nodebb" \
    mongo__password="Password1!"

# Custom from github
RUN git clone https://github.com/andyprobasco/nodebb-theme-themanadrain.git /plugins/nodebb-theme-themanadrain && \
    npm install /plugins/nodebb-theme-themanadrain

# CMD bash
CMD ./install_plugins.sh && ./nodebb setup && ./nodebb start
