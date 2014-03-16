#! /usr/bin/env python3

import argparse
import os
import random
import string
import subprocess


def parse_args():
    parser = argparse.ArgumentParser()

    subparsers = parser.add_subparsers(help="commands")

    parser_add = subparsers.add_parser("add")
    parser_add.set_defaults(func=add)
    parser_add.add_argument("name", help="name of the database")
    parser_add.add_argument("-u", "--username",
            help="username (defaults to database name)")
    parser_add.add_argument("-p", "--password",
            help="password (defaults to a random password)")

    parser_bash = subparsers.add_parser("bash")
    parser_bash.set_defaults(func=bash)

    parser_mysql = subparsers.add_parser("mysql")
    parser_mysql.set_defaults(func=mysql)
    parser_mysql.add_argument("-u", "--username",
            help="username (defaults to root)")
    parser_mysql.add_argument("-p", "--password",
            help="password (defaults root's password from the container)")

    return parser.parse_args()


def get_server_details(username=None, password=None):
    server = dict()
    server["username"] = username or "root"
    server["password"] = password

    try:
        if server["password"] is None:
            with open("/data/.root_password", "r") as f:
                server["password"] = f.read().strip()
        server["host"] = os.environ["DB_PORT_3306_TCP_ADDR"]
        server["port"] = os.environ["DB_PORT_3306_TCP_PORT"]
    except IOError:
        raise Exception("Root password not found. Did you add the MySQL "
                "container's volumes with \"-volumes-from mariadb\"")
    except KeyError:
        raise Exception("Database server address or port not found. "
                "Did you link the MySQL with \"-link mariadb:db\"?")

    return server


def add(args):
    server = get_server_details()
    database = args.name
    username = args.username
    if username is None:
        username = database
    password = args.password
    if password is None:
        password = "".join([random.choice(string.ascii_letters + string.digits)
            for n in range(32)])

    mysql_commands = (
            "CREATE DATABASE `{database}` "
                "DEFAULT CHARACTER SET `utf8` COLLATE `utf8_unicode_ci`;"
            "CREATE USER '{username}'@'%' IDENTIFIED BY '{password}';"
            "GRANT ALL PRIVILEGES ON `{database}`.* to '{username}'@'%' "
                "WITH GRANT OPTION;"
            ).format(database=database, username=username, password=password)

    retval = subprocess.call(["mysql",
            "--user={0}".format(server["username"]),
            "--password={0}".format(server["password"]),
            "--host={0}".format(server["host"]),
            "--port={0}".format(server["port"]),
            "--execute={0}".format(mysql_commands)
            ])

    if retval is not 0:
        raise Exception("Failed to add database or user. "
            "Do they already exist?")

    print("Added new database and user")
    print("Database: {database}\nUsername: {username}\nPassword: {password}"
            .format(database=database, username=username, password=password))


def bash(args):
    subprocess.call("bash")


def mysql(args):
    server = get_server_details(username=args.username, password=args.password)
    subprocess.call(["mysql",
            "--user={0}".format(server["username"]),
            "--password={0}".format(server["password"]),
            "--host={0}".format(server["host"]),
            "--port={0}".format(server["port"])
            ])


def main():
    args = parse_args()
    args.func(args)

if __name__ == "__main__":
    main()
