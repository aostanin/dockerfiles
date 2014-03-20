FROM debian:squeeze

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN apt-get update -q
RUN apt-get install -qy locales
RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
RUN dpkg-reconfigure locales

RUN apt-get install -qy unzip curl

ADD http://download-new.utorrent.com/endpoint/utserver/os/linux-x64-debian-6-0/track/beta /tmp/utorrent.tar.gz
RUN tar xzf /tmp/utorrent.tar.gz && \
    rm /tmp/utorrent.tar.gz

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/downloads"]
# Torrent port
EXPOSE 53160
EXPOSE 53160/udp
# WebUI
EXPOSE 8080

CMD ["/start.sh"]
