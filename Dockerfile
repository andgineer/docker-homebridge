FROM ubuntu:latest

#COPY config.json /.homebridge/

RUN apt-get update -qq \
  && apt-get install -y libnss-mdns libavahi-compat-libdnssd-dev avahi-daemon avahi-discover \
  && apt-get install -y nodejs npm \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10 \
  && npm install -g homebridge \
  && npm install -g homebridge-openhab

#WORKDIR /

#EXPOSE ?

CMD ["homebridge"]
