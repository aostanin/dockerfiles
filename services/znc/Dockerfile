FROM aostanin/debian

ENV ZNC_VERSION 1.4

RUN apt-get install -qy --force-yes build-essential libperl-dev libssl-dev

ADD http://znc.in/releases/znc-$ZNC_VERSION.tar.gz /tmp/znc.tar.gz
RUN tar xzf /tmp/znc.tar.gz && \
    rm /tmp/znc.tar.gz

# Push module (https://github.com/jreese/znc-push)
ADD https://raw.github.com/jreese/znc-push/master/push.cpp /znc-$ZNC_VERSION/modules/push.cpp
# Colloquy push modules (https://github.com/wired/colloquypush)
ADD https://raw.github.com/wired/colloquypush/master/znc/colloquy.cpp /znc-$ZNC_VERSION/modules/colloquy.cpp

RUN cd /znc-$ZNC_VERSION && \
    ./configure && \
    make && \
    make install
RUN useradd --system --user-group --home-dir /data --no-create-home znc

ADD znc.conf /znc.conf.default

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 6667

CMD ["/start.sh"]
