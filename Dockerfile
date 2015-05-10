FROM resin/rpi-raspbian:wheezy
MAINTAINER Daniel Hiltgen <daniel@hiltgen.com>

RUN apt-get update && apt-get install -y \
	ow-shell \
	owserver  && \
	rm -rf /var/lib/apt/lists/*

# Note: To be really useful, you'll need to mount/copy your own owfs.conf
#       but we'll make the stock "fake" one actually work...
RUN sed -i -e "s/localhost:4304/\*:4304/g" /etc/owfs.conf


EXPOSE 4304
CMD /usr/bin/owserver -c /etc/owfs.conf --foreground
