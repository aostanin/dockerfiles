FROM aostanin/debian

RUN echo 'deb http://ppa.launchpad.net/deluge-team/ppa/ubuntu precise main' > /etc/apt/sources.list.d/deluge.list
RUN apt-key adv --recv-keys --keyserver pgp.surfnet.nl 249AD24C
RUN apt-get update -q

RUN apt-get install -t precise -qy deluged deluge-web

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/downloads"]
# Torrent port
EXPOSE 53160
EXPOSE 53160/udp
# WebUI
EXPOSE 8112
# Daemon
EXPOSE 58846

CMD ["/start.sh"]
