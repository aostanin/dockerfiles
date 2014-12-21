FROM ubuntu:trusty

ENV LANG en_US.UTF-8
RUN locale-gen $LANG

RUN apt-get update -q && \
    apt-get install -y git openssh-server && \
    git clone https://github.com/sitaramc/gitolite.git /tmp/gitolite && \
    /tmp/gitolite/install -to /usr/local/bin && \
    rm -rf /tmp/gitolite && \
    mkdir -p /var/run/sshd && \
    adduser --disabled-login --gecos 'Gitolite' --home /data --no-create-home git

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/repositories"]
EXPOSE 22

CMD ["/start.sh"]
