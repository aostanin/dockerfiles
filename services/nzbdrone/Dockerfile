FROM aostanin/debian

# NzbDrone prefers Mono 3.2 which is in unstable/experimental
RUN echo 'deb http://http.debian.net/debian experimental main' > /etc/apt/sources.list.d/debian-experimental.list
RUN echo 'deb http://http.debian.net/debian unstable main' > /etc/apt/sources.list.d/debian-unstable.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC
RUN echo 'deb http://update.nzbdrone.com/repos/apt/debian master main' > /etc/apt/sources.list.d/nzbdrone.list

RUN apt-get update -q
RUN apt-get install -qy libmono-cil-dev -t experimental
RUN apt-get install -qy nzbdrone

ADD start.sh /start.sh

VOLUME ["/data"]
# Incoming downloads
VOLUME ["/downloads"]
# TV library
VOLUME ["/tv"]
EXPOSE 8989

CMD ["/start.sh"]
