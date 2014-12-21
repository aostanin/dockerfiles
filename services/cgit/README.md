# docker-cgit

## Description

A Dockerfile for [cgit](http://git.zx2c4.com/cgit/).

## Volumes

### `/data`

`/data/cgitrc` is the cgit configuration file.

`/data/lighttpd.conf` is the Lighttpd configuration file.

### `/repositories`

Contains the git repositories.

## Ports

### 80

HTTP port.

