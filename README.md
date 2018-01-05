### Homebridge server in Docker

[Homebridge](https://www.npmjs.com/package/homebridge) server to integrate with 
Apple smart home (homekit).

Incapsulated into Docker to install on Synology.

With [openhab plugin](https://www.npmjs.com/package/homebridge-openhab).

To run it:
```
docker rm -f homebridge
docker run --net host -it --name homebridge -v $PWD/homebridge:/.homebridge:ro masterandrey/docker-homebridge
```

In folder `homebridge` you should have [config.json](https://github.com/masterandrey/docker-homebridge/blob/master/config.json).

Installation on Synology is the same as described in [Amazon dash button hack](http://masterandrey.com/posts/en/amazon_dash_button_hack_install/).
Just rename image name `docker-amazon-dash-button-hack` into `docker-homebridge` and
folder name `amazon-dash-private` into `homebridge`.
