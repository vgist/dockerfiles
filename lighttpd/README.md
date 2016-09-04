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