![](https://img.shields.io/badge/MariaDB-10.1.14-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.4-brightgreen.svg) ![](https://img.shields.io/docker/stars/registercn/mariadb.svg) ![](https://img.shields.io/docker/pulls/registercn/mariadb.svg)

#### Volume:

- /var/lib/mysql

#### Environment:

- MYSQL_DATABASE: specify the name of the database
- MYSQL_USER: specify the User for the database
- MYSQL_PASSWORD: specify the User password for the database
- MYSQL_ROOT_PASSWORD: specify the root password for Mariadb
- MYSQL_ALLOW_EMPTY_PASSWORD:  allow the container to be started with a blank password for the root user
- MYSQL_RANDOM_ROOT_PASSWORD: generate a random initial password for the root user (using pwgen)
- MYSQL_ONETIME_PASSWORD: Sets root (not the user specified in MYSQL_USER!) user as expired once init is complete, forcing a password change on first login.

#### Compose example:

    mariadb:
        image: registercn/mariadb:latest
        environment:
            MYSQL_ROOT_PASSWORD=123456
        ports:
            - "3306:3306"
        volumes:
            - /path/data:/var/lib/mysql
        restart: always

#### Creating an instance:

    docker run -it --name mariadb -p 3306:3306 -v /path/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 registercn/mariadb