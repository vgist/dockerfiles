![](https://img.shields.io/badge/Lighttpd-1.4.39-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.4-brightgreen.svg) ![](https://img.shields.io/docker/stars/registercn/lighttpd.svg) ![](https://img.shields.io/docker/pulls/registercn/lighttpd.svg)

#### Volume

- /var/www

#### Creating an instance:

    docker run -d --name lighttpd -p 80:80 registercn/lighttpd

#### Compose:

```
lighttpd:
    image: registercn/lighttpd
    ports:
        - "80:80"
    volumes:
        - ./path:/var/www
    restart: always
```