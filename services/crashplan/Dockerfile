FROM ubuntu:trusty

ENV LANG en_US.UTF-8

RUN locale-gen $LANG

ADD https://download.code42.com/installs/linux/install/CrashPlan/CrashPlan_4.3.0_Linux.tgz /tmp/CrashPlan.tgz
RUN apt-get update -q && \
    apt-get install -qy curl && \
    cd /tmp && \
    tar xf CrashPlan.tgz && \
    cd CrashPlan-install && \
    sed -i 's/^more /: /g' install.sh && \
    (echo; echo; echo yes; echo ; echo y; echo; echo /backups; echo y; echo; echo; echo y; echo) | ./install.sh && \
    cd /usr/local/crashplan && \
    sleep 10 && \
    sed -i 's/<serviceHost>127.0.0.1<\/serviceHost>/<serviceHost>0.0.0.0<\/serviceHost>/g' /usr/local/crashplan/conf/my.service.xml && \
    mv /usr/local/crashplan/conf /usr/local/crashplan/conf.default && \
    ln -s /data/conf /usr/local/crashplan/conf && \
    mv /usr/local/crashplan/log /usr/local/crashplan/log.default && \
    ln -s /data/log /usr/local/crashplan/log && \
    mv /var/lib/crashplan /var/lib/crashplan.default && \
    ln -s /data/crashplan /var/lib/crashplan && \
    rm -rf /tmp/CrashPlan.tgz /tmp/CrashPlan-install

ADD start.sh /start.sh

VOLUME ["/data"]
VOLUME ["/backups"]
EXPOSE 4242
EXPOSE 4243

CMD ["/start.sh"]
