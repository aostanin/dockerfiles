# docker-mysql-client

## Description

MySQL client to use with `aostanin/mariadb`. Automates adding new databases to MySQL.

## Usage

```bash
docker run -t -i -rm -volumes-from mariadb -link mariadb:db aostanin/mysql-client <command> <arguments>
```

Link your `aostanin/mariadb` container as `db`. `-volumes-from` is used to get the root password.

### Commands

#### `add`

Adds a new database.

```bash
usage: start.py add [-h] [-u USERNAME] [-p PASSWORD] name

positional arguments:
  name                  name of the database

optional arguments:
  -h, --help            show this help message and exit
  -u USERNAME, --username USERNAME
                        username (defaults to database name)
  -p PASSWORD, --password PASSWORD
                        password (defaults to a random password)
```

##### Example

```bash
docker run -t -i -rm -volumes-from mariadb -link mariadb:db aostanin/mysql-client add gitlab
```

#### `mysql`

Runs the `mysql` command. Automatically connects to the database.

```bash
usage: start.py mysql [-h] [-u USERNAME] [-p PASSWORD]

optional arguments:
  -h, --help            show this help message and exit
  -u USERNAME, --username USERNAME
                        username (defaults to root)
  -p PASSWORD, --password PASSWORD
                        password (defaults root's password from the container)
```

#### `bash`

Starts a bash shell.

