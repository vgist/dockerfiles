![](https://img.shields.io/docker/stars/gists/php.svg) ![](https://img.shields.io/docker/pulls/gists/php.svg)

- ![](https://img.shields.io/badge/PHP7-7.1.17-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.7-brightgreen.svg) latest ([7/fpm/Dockerfile](https://github.com/iHavee/dockerfiles/blob/master/php/7/fpm/Dockerfile))
- ![](https://img.shields.io/badge/PHP7-7.1.17-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.7-brightgreen.svg) 7, 7-fpm ([7/fpm/Dockerfile](https://github.com/iHavee/dockerfiles/blob/master/php/7/fpm/Dockerfile))
- ![](https://img.shields.io/badge/PHP-5.6.36-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.7-brightgreen.svg) 5, 5-fpm ([5/fpm/Dockerfile](https://github.com/iHavee/dockerfiles/blob/master/php/5/fpm/Dockerfile))

#### Environment:

| Environment          | Variable             | Default value |
|----------------------|----------------------|---------------|
| MEMORY_LIMIT         | memory_limit         | 256M          |
| MAX_EXECUTION_TIME   | max_execution_time   | 60            |
| UPLOAD_MAX_FILESIZE  | upload_max_filesize  | 64M           |
| MAX_FILE_UPLOADS     | max_file_uploads     | 20            |
| POST_MAX_SIZE        | post_max_size        | 64M           |
| MAX_INPUT_VARS       | max_input_vars       | 4000          |
| DATE_TIMEZONE        | date.timezone        | Asia/Shanghai |
| PM_MAX_CHILDREN      | pm.max_children      | 6             |
| PM_START_SERVERS     | pm.start_servers     | 4             |
| PM_MIN_SPARE_SERVERS | pm.min_spare_servers | 2             |
| PM_MAX_SPARE_SERVERS | pm.max_spare_servers | 6             |
| UID                  | user id              | 100           |
| GID                  | group id             | 101           |

#### Volume:

- /var/www

#### Custom usage:

    docker run \
        -d \
        --name php-fpm \
        -v /path/www:/var/www \
        -e UPLOAD_MAX_FILESIZE=128M
        gists/php:7

#### Compose example:

```
version: '3'

services:
    php:
        container_name: php
        image: gists/php
        volumes:
            - /path/www:/var/www
            - phpsocket:/run/php
        environment:
            UPLOAD_MAX_FILESIZE=128M
        restart: always
    nginx:
        container_name: nginx
        image: nginx:stable-alpine
        ports:
            - "80:80"
            - "443:443"
        volumes:
            - /path/www:/var/www
            - phpsocket:/run/php
        depends_on:
            - php
        restart: always
volumes:
    phpsocket:
```

#### nginx configuration with php-fpm

    fastcgi_pass    unix:/run/php/php-fpm.sock;
