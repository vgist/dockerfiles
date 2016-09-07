![](https://img.shields.io/badge/Lighttpd-1.4.39-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.4-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/lighttpd.svg) ![](https://img.shields.io/docker/pulls/gists/lighttpd.svg)

#### Volume

- /var/www

#### Creating an instance:

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
