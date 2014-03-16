FROM aostanin/debian

RUN apt-get install -qy mysql-client python3

ADD start.py /start.py

ENTRYPOINT ["/start.py"]
