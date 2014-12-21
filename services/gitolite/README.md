# docker-gitolite

## Description

A Dockerfile for [Gitolite](http://gitolite.com/).

## Volumes

### `/data`

`/data/` is the `git` user's home directory.

`/data/admin` and `/data/admin.pub` are automatically generated admin SSH keys.

### `/repositories`

`/repositories` contains the git repositories.

## Ports

### 22

SSH port.

