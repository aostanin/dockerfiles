FROM aostanin/debian

RUN apt-get install -qy git-core python2.7
RUN apt-get install -qy python-cheetah
RUN git clone https://github.com/sabnzbd/sabnzbd.git /sabnzbdplus

RUN sed -i 's/main$/main non-free/' /etc/apt/sources.list
RUN apt-get update -q

RUN apt-get install -qy python-configobj python-feedparser python-dbus python-openssl python-support python-yenc par2 unrar unzip

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/downloads"]
EXPOSE 8080

CMD ["/start.sh"]
