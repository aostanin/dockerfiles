FROM aostanin/debian

RUN apt-get install -qy git-core python2.7
RUN git clone https://github.com/rembo10/headphones.git /headphones

ADD start.sh /start.sh

VOLUME ["/data"]
# Torrent watch directory
VOLUME ["/torrents"]
# Incoming downloads
VOLUME ["/downloads"]
# Music library
VOLUME ["/music"]
EXPOSE 8181

CMD ["/start.sh"]
