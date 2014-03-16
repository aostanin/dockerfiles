FROM aostanin/debian

RUN echo 'deb http://code.bitlbee.org/debian/devel/wheezy/amd64/ ./' > /etc/apt/sources.list.d/bitlbee.list
ADD bitlbee.key /bitlbee.key
RUN apt-key add /bitlbee.key
RUN apt-get update -q

RUN apt-get install -qy bitlbee bitlbee-plugin-skype

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 6667

CMD ["/start.sh"]
