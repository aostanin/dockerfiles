FROM aostanin/debian

RUN apt-get install -qy git-core python2.7
RUN apt-get install -qy python-openssl
RUN git clone https://github.com/pillone/usntssearch.git /nzbmegasearch

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 5000

CMD ["/start.sh"]
