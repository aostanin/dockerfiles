# docker-gitlab

## Description

A Dockerfile for [GitLab](https://www.gitlab.com/) version 6.7.

## Volumes

### `/data`

`/data/git/authorized_keys` contains the SSH authorized keys for the `git` user.

`/data/gitlab` contains various configuration files for GitLab.

`/data/gitlab-shell` contains various configuration files for GitLab Shell.

`/data/ssh` contains configuration files for ssh.

## Ports

### 22

SSH port.

### 80

GitLab HTTP port.

## Links

### `db`

The database container with MySQL or a MySQL-compatible server on port 3306. GitLab's database configuration file is automatically written with the IP address and port from this container. If you do not link this container then you must specify the `DB_HOST` and `DB_PORT` environment variables.

## Environment Variables

### `GITLAB_HOST`

The hostname of the GitLab server. Defaults to `localhost`.

### `GITLAB_EMAIL`

Email address which GitLab sends from. Defaults to `gitlab@GITLAB_HOST`.

### `SUPPORT_EMAIL`

Email address for support. Defaults to `support@GITLAB_HOST`.

### `UNICORN_WORKERS`

Number of unicorn workers. Defaults to 1.

### `DB_HOST`

Database host. If a database container is linked as `db` then this is set automatically.

### `DB_PORT`

Database port. If a database container is linked as `db` then this is set automatically.

### `DB_DATABASE`

Name of the database. Defaults to `gitlab`.

### `DB_USERNAME`

Database login username. Defaults to `gitlab`.

### `DB_PASSWORD`

Database login password. Defaults to blank.

