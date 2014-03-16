FROM aostanin/debian

RUN apt-get install -qy gdebi-core

ADD http://downloads.plexapp.com/plex-media-server/0.9.9.5.411-da1d892/plexmediaserver_0.9.9.5.411-da1d892_amd64.deb /tmp/plexmediaserver.deb
RUN gdebi -qn /tmp/plexmediaserver.deb && rm /tmp/plexmediaserver.deb

ADD start.sh /start.sh

VOLUME ["/data"]
# Music library
VOLUME ["/music"]
# Video library
VOLUME ["/videos"]
EXPOSE 32400

CMD ["/start.sh"]
