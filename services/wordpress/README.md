# docker-wordpress

## Description

A Dockerfile for [WordPress](http://wordpress.org/).

## Volumes

### `/data`

Contains the `wp-config.php` file and `wp-content` directory.

## Ports

### 80

WordPress HTTP port.

## Links

### `db`

The database container with MySQL or a MySQL-compatible server on port 3306. WordPress's database configuration file is automatically written with the IP address and port from this container.

