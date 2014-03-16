FROM aostanin/debian

RUN apt-get install -qy openjdk-6-jre
ADD http://downloads.sourceforge.net/project/subsonic/subsonic/4.9/subsonic-4.9.deb /tmp/subsonic.deb
RUN dpkg -i /tmp/subsonic.deb && rm /tmp/subsonic.deb

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/music"]
EXPOSE 4040

CMD ["/start.sh"]
