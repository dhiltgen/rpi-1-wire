1-Wire Server for Raspberry PI
==============================

* [Git](https://github.com/dhiltgen/rpi-1-wire)
* [Dockerfile](https://github.com/dhiltgen/rpi-1-wire/blob/master/Dockerfile)


This builds an image for a 1-wire server for raspberry pi.  Since there are
various different 1-wire masters available, you will have to jump through
a couple hoops to get this working on your rpi.

OS Image
--------

There are various ways to get docker on your rpi,
but I've found the easiest these days is to head on over to
[Hypriot](http://blog.hypriot.com/post/hypriotos-back-again-with-docker-on-arm/)
and download one of their images.


i2c Master
----------

One popular master is the DS2482 which can be fairly easily hooked up to
the GPIO header on the raspberry pi.  If this is your master of choice,
and assuming you're using the hypriot image, you'll have to add the
following two entries to your */etc/modules* and reboot:

```
i2c-bcm2708 
i2c-dev
```

Then you can run the owserver with something like:

```
docker run --rm -it --privileged -v /dev/i2c-1:/dev/i2c-1 -v `pwd`/owfs-i2c.conf:/etc/owfs.conf -p 4304:4304 dhiltgen/rpi-1-wire
```

USB Master
----------

Another easy option (if you don't mind chewing up a USB port) is to use
the USB based 1-wire master.

TODO
