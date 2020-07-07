FROM ubuntu:18.04
MAINTAINER @schmichael

RUN apt-get update && apt-get install -y curl libfontconfig desktop-file-utils
RUN curl -o /tmp/insync-client.deb -L https://downloads.druva.com/downloads/inSync/Linux/5.9/druva-insync-client_5.9-76740_amd64.deb && \
  dpkg -i /tmp/insync-client.deb

RUN apt-get clean && \
  apt-get remove -y --purge curl && \
  apt autoremove -y && \
  rm -rf /tmp/* && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT USER=root inSync
