FROM node:current-slim

RUN apt-get update
RUN apt-get install -y git calibre

RUN mkdir /build && chown node:node /build && chmod 0750 /build

# Install custom gitbook version
RUN npm i gitbook-cli -g 

USER node

RUN git clone -b fix/filename-regex https://github.com/PauloASilva/gitbook.git ~/gitbook-custom && \
    cd ~/gitbook-custom && npm  i && \
    gitbook alias ~/gitbook-custom latest

WORKDIR /build

