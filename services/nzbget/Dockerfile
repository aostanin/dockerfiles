FROM ubuntu:trusty

ENV LANG en_US.UTF-8
ENV VERSION 15.0

RUN locale-gen $LANG

RUN sed -i 's/restricted$/restricted multiverse/' /etc/apt/sources.list && \
    apt-get update -q

RUN apt-get install -qy build-essential pkg-config libxml2-dev libncurses5-dev libsigc++-2.0-dev libpar2-dev libssl-dev p7zip unrar

ADD http://downloads.sourceforge.net/project/nzbget/nzbget-stable/$VERSION/nzbget-$VERSION.tar.gz /tmp/nzbget.tar.gz
RUN tar xf /tmp/nzbget.tar.gz && \
    rm /tmp/nzbget.tar.gz && \
    cd /nzbget-$VERSION && \
    ./configure && \
    make && \
    make install && \
    rm -rf /nzbget-$VERSION

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 6789

CMD ["/start.sh"]
