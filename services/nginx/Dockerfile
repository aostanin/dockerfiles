FROM aostanin/debian

RUN apt-get install -qy nginx

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 80

CMD ["/start.sh"]
