FROM ubuntu:trusty

ENV LANG en_US.UTF-8

RUN locale-gen $LANG

RUN apt-get update -q && \
    apt-get install -qy build-essential git-core libssl-dev lighttpd

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf.default
ADD cgitrc /etc/cgitrc.default

RUN git clone https://github.com/zx2c4/cgit.git /tmp/cgit && \
    cd /tmp/cgit && \
    git submodule update --init && \
    make install && \
    cd / && \
    rm -rf /tmp/cgit && \
    ln -s /data/cgitrc /etc/cgitrc

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/repositories"]
EXPOSE 80

CMD ["/start.sh"]
