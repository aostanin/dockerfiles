# docker-btsync

## Description

A Dockerfile for [BitTorrent Sync](http://www.bittorrent.com/sync/).

## Volumes

### `/data`

Configuration files and state for BitTorrent Sync.

### `/sync`

A place to put your files to sync.

## Ports

### 3369

Sync protocol TCP port.

### 3369/udp

Sync protocol UDP port.

### 8888

WebUI port.

