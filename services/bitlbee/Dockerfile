FROM ubuntu:trusty

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN echo 'deb http://code.bitlbee.org/debian/devel/trusty/amd64/ ./' > /etc/apt/sources.list.d/bitlbee.list
ADD bitlbee.key /bitlbee.key
RUN apt-key add /bitlbee.key && \
    apt-get update -q

RUN apt-get install -qy bitlbee

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 6667

CMD ["/start.sh"]
