![](https://images.microbadger.com/badges/version/gists/lighttpd.svg) ![](https://images.microbadger.com/badges/image/gists/lighttpd.svg) ![](https://img.shields.io/docker/stars/gists/lighttpd.svg) ![](https://img.shields.io/docker/pulls/gists/lighttpd.svg)

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
