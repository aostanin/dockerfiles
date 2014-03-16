FROM aostanin/ubuntu

RUN apt-get install -qy unzip

ADD http://www.deanbg.com/ps3netsrv.zip /tmp/ps3netsrv.zip
RUN unzip -q /tmp/ps3netsrv.zip -d /ps3netsrv && \
    rm /tmp/ps3netsrv.zip
RUN chmod +x /ps3netsrv/linux/*

# ps3netsrv doesn't have any config files, so no need for /data
VOLUME ["/ps3"]
EXPOSE 38008

CMD ["/ps3netsrv/linux/ps3netsrv64", "/ps3"]
