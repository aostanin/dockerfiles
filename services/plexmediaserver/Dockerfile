FROM aostanin/debian

RUN apt-get install -qy gdebi-core

ADD http://downloads.plexapp.com/plex-media-server/0.9.9.7.429-f80a8d6/plexmediaserver_0.9.9.7.429-f80a8d6_amd64.deb /tmp/plexmediaserver.deb
RUN gdebi -qn /tmp/plexmediaserver.deb && rm /tmp/plexmediaserver.deb

ADD start.sh /start.sh

VOLUME ["/data"]
# Music library
VOLUME ["/music"]
# Video library
VOLUME ["/videos"]
EXPOSE 32400

CMD ["/start.sh"]
