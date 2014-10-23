FROM ubuntu:trusty

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
    echo 'deb http://update.nzbdrone.com/repos/apt/debian torrents main' > /etc/apt/sources.list.d/nzbdrone.list && \
    apt-get update -q

RUN apt-get install -qy libmono-cil-dev nzbdrone

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 8989

CMD ["/start.sh"]
