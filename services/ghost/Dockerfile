FROM ubuntu:trusty

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN echo 'deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu precise main' > /etc/apt/sources.list.d/nodejs.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12 && \
    apt-get update -q

RUN apt-get install -qy nodejs unzip

ADD https://ghost.org/zip/ghost-latest.zip /tmp/ghost.zip
RUN unzip -q /tmp/ghost.zip -d /ghost && \
    rm /tmp/ghost.zip && \
    sed -i "s/host:\s*'127.0.0.1'/host: '0.0.0.0'/" /ghost/config.example.js && \
    cd /ghost && npm install --production

ADD start.sh /start.sh

WORKDIR /ghost

VOLUME ["/data"]
EXPOSE 2368

CMD ["/start.sh"]
