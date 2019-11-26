![](https://images.microbadger.com/badges/version/gists/simple-obfs.svg) ![](https://images.microbadger.com/badges/image/gists/simple-obfs.svg) ![](https://img.shields.io/docker/stars/gists/simple-obfs.svg) ![](https://img.shields.io/docker/pulls/gists/simple-obfs.svg)

#### Environment:

| Environment | Default value  |
|-------------|----------------|
| SERVER_ADDR | 0.0.0.0        |
| SERVER_PORT | 8388           |
| DNS_SERVER  | 8.8.8.8        |
| OBFS_OPTS   | http           |
| FORWARD     | 127.0.0.1:8388 |
| FAILOVER    | www.163.com:80 |

#### Creating an instance:

    docker run \
        -d \
        --name simple-obfs \
        -p 12345:12345 \
        -e FORWARD=127.0.0.1:8388
        gists/simple-obfs

#### Compose file with custom command:

    simple-obfs:
        image: gists/simple-obfs
        ports:
            - "12345:12345"
        command: obfs-server -s 0.0.0.0 -p 12345 --obfs http -r 127.0.0.1:8388
        restart: always

#### Compose example with shadowsocks-libev

    version: '3'

    services:
        shadowsocks:
            container_name: shadowsocks
            image: gists/shadowsocks-libev
            ports:
                - "12345:8388/udp"
            networks:
                overlay:
            environment:
              - PASSWORD=passowrd
              - METHOD=chacha20-ietf-poly1305
            restart: always

          simple-obfs:
            container_name: obfs
            image: gists/simple-obfs
            ports:
                - "12345:8388/tcp"
            environment:
                - FORWARD=shadowsocks:8388
            depends_on:
                - shadowsocks
            networks:
                overlay:
            restart: always

    networks:
        overlay:
            driver: bridge

