FROM aostanin/debian

RUN apt-get install -qy git-core python2.7
RUN apt-get install -qy python-cheetah
RUN git clone https://github.com/midgetspy/Sick-Beard.git /sickbeard

ADD start.sh /start.sh

VOLUME ["/data"]
# Torrent watch directory
VOLUME ["/torrents"]
# Incoming downloads
VOLUME ["/downloads"]
# TV library
VOLUME ["/tv"]
EXPOSE 8081

CMD ["/start.sh"]
