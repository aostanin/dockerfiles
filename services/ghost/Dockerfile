FROM aostanin/ubuntu

RUN echo 'deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu precise main' > /etc/apt/sources.list.d/nodejs.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12
RUN apt-get update -q

RUN apt-get install -qy nodejs unzip

ADD https://ghost.org/zip/ghost-0.4.2.zip /tmp/ghost.zip
RUN unzip -q /tmp/ghost.zip -d /ghost && rm /tmp/ghost.zip
RUN sed -i "s/host:\s*'127.0.0.1'/host: '0.0.0.0'/" /ghost/config.example.js
RUN cd /ghost && npm install --production

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 2368

CMD ["/start.sh"]
