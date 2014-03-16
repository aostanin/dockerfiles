FROM aostanin/debian

RUN apt-get install -qy gdebi-core

ADD http://get.pyload.org/get/ubuntu /tmp/pyload.deb
RUN gdebi -qn /tmp/pyload.deb && rm /tmp/pyload.deb

RUN apt-get install -qy python-openssl spidermonkey-bin

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/downloads"]
EXPOSE 8001

CMD ["/start.sh"]
