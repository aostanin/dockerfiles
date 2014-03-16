FROM aostanin/debian

RUN apt-get install -qy nginx php5-fpm php5-mysql

ADD http://wordpress.org/latest.tar.gz /tmp/wordpress.tar.gz
RUN tar xzf /tmp/wordpress.tar.gz && rm /tmp/wordpress.tar.gz

ADD default /etc/nginx/sites-enabled/default

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 80

CMD ["/start.sh"]
