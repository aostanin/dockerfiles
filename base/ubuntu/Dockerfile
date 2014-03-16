FROM ubuntu:precise

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN apt-get update -q
RUN apt-get install -qy locales
RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
RUN dpkg-reconfigure locales
