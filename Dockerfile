FROM ubuntu:latest

RUN apt-get update -qq \
  && apt-get install -y locales curl wget nano \
  && apt-get install -y libnss-mdns libkrb5-dev libavahi-compat-libdnssd-dev avahi-daemon avahi-discover \
  && apt-get install -y nodejs npm \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10 \
  && npm install -g --unsafe-perm homebridge \
  && npm install -g homebridge-openhab \
  && mkdir -p /var/run/dbus \
  && rm -f /var/run/dbus/pid /var/run/avahi-daemon/pid \
  && dbus-daemon --system --nofork \
  && until [[ -e /var/run/dbus/system_bus_socket ]]; do sleep 1s; done \
  && avahi-daemon -D

CMD ["homebridge"]
