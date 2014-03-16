FROM aostanin/debian

RUN apt-get install -qy git-core python2.7
RUN git clone https://github.com/mrkipling/maraschino.git /maraschino

ADD start.sh /start.sh

VOLUME ["/data"]
EXPOSE 7000

CMD ["/start.sh"]
