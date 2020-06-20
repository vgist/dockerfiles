![](https://images.microbadger.com/badges/version/gists/mariadb.svg) ![](https://images.microbadger.com/badges/image/gists/mariadb.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/mariadb>

Automatically built by Github Actions

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

#### Custom usage:

    docker run \
        -d \
        --name mariadb \
        -p 3306:3306 \
        -v /path/data:/var/lib/mysql \
        -e MYSQL_ROOT_PASSWORD=123456 \
        gists/mariadb

#### Compose example:

    mariadb:
        image: gists/mariadb:latest
        environment:
            MYSQL_ROOT_PASSWORD=123456
        ports:
            - "3306:3306"
        volumes:
            - /path/data:/var/lib/mysql
        restart: always
