FROM aostanin/debian

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
RUN echo 'deb http://update.nzbdrone.com/repos/apt/debian master main' >> /etc/apt/sources.list.d/nzbdrone.list
RUN apt-get update -q

RUN apt-get install -qy nzbdrone

ADD start.sh /start.sh

VOLUME ["/data"]
# Incoming downloads
VOLUME ["/downloads"]
# TV library
VOLUME ["/tv"]
EXPOSE 8989

CMD ["/start.sh"]
