Dockerfile <https://github.com/vgist/dockerfiles/tree/master/shadowsocks/rust/>

Automatically built by Github Actions

### Environment:

| Environment | Default value |
|-------------|---------------|
| SERVER_ADDR | 0.0.0.0:8388  |
| PASSWORD    | $(hostname)   |
| METHOD      | aes-256-gcm   |
| TIMEOUT     | 300           |
| DNS_ADDR    | 8.8.8.8       |

### Creating an instance:

    docker run \
        -d \
        --name shadowsocks \
        -p 12345:8388 \
        -p 12345:8388/udp \
        -e PASSWORD=password \
        -e METHOD=chacha20-ietf-poly1305 \
        gists/shadowsocks-rust

### Compose example:

    shadowsocks:
        image: gists/shadowsocks-rust
        ports:
            - "12345:8388/tcp"
            - "12345:8388/udp"
        environment:
            - PASSWORD=password
            - METHOD=chacha20-ietf-poly1305
      restart: always

### Compose file with custom command

    shadowsocks:
        image: gists/shadowsocks-rust
        ports:
            - "12345:8388/tcp"
            - "12345:8388/udp"
        volumes:
            - ./shadowsocks.json:/shadowsocks.json
        command: ssserver -c /shadowsocks.json
        restart: always
