FROM ubuntu:trusty

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN sed -i 's/restricted$/restricted multiverse/' /etc/apt/sources.list && \
    apt-get update -q && \
    apt-get install -qy git-core python2.7 unrar

RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git /couchpotato

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 5050

CMD ["/start.sh"]
