FROM aostanin/debian

RUN sed -i 's/main$/main non-free/' /etc/apt/sources.list
RUN apt-get update -q

RUN apt-get install -qy build-essential pkg-config libxml2-dev libncurses5-dev libsigc++-2.0-dev libpar2-0-dev libssl-dev
RUN apt-get install -qy p7zip unrar

ADD http://downloads.sourceforge.net/project/parchive/libpar2/0.2/libpar2-0.2.tar.gz /tmp/libpar2.tar.gz
RUN tar xzf /tmp/libpar2.tar.gz && \
    rm /tmp/libpar2.tar.gz

ADD http://downloads.sourceforge.net/project/nzbget/nzbget-stable/12.0/nzbget-12.0.tar.gz /tmp/nzbget.tar.gz
RUN tar xzf /tmp/nzbget.tar.gz && \
    rm /tmp/nzbget.tar.gz

RUN cd /libpar2-0.2 && \
    patch < /nzbget-12.0/libpar2-0.2-bugfixes.patch && \
    patch < /nzbget-12.0/libpar2-0.2-cancel.patch && \
    ./configure && \
    make && \
    make install

RUN cd /nzbget-12.0 && \
    ./configure && \
    make && \
    make install

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/downloads"]
EXPOSE 6789

CMD ["/start.sh"]
