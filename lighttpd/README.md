![](https://img.shields.io/badge/Lighttpd-1.4.48-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.7-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/lighttpd.svg) ![](https://img.shields.io/docker/pulls/gists/lighttpd.svg)

#### Environment:

| Environment | Variable | Default value |
|-------------|----------|---------------|
| UID         | user id  | 100           |
| GID         | group id | 101           |

#### Volume

- /var/www

#### Custom usage:

    docker run -d --name lighttpd -p 80:80 gists/lighttpd

#### Compose:

```
lighttpd:
    image: gists/lighttpd
    ports:
        - "80:80"
    volumes:
        - ./path:/var/www
    restart: always
```
