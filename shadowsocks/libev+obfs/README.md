![](https://images.microbadger.com/badges/version/gists/shadowsocks-libev.simple-obfs.svg) ![](https://images.microbadger.com/badges/image/gists/shadowsocks-libev.simple-obfs.svg) ![](https://img.shields.io/docker/stars/gists/shadowsocks-libev.simple-obfs.svg) ![](https://img.shields.io/docker/pulls/gists/shadowsocks-libev.simple-obfs.svg)

#### Environment:

| Environment | Default value |
|-------------|---------------|
| SERVER_ADDR | 0.0.0.0       |
| SERVER_PORT | 8388          |
| PASSWORD    | $(hostname)   |
| METHOD      | rc4-md5       |
| TIMEOUT     | 300           |
| DNS_ADDR    | 8.8.8.8       |
| DNS_ADDR_2  | 8.8.4.4       |
| PLUGIN      | obfs-server   |
| PLUGIN_OPTS | obfs=http     |

#### Creating an instance:

    docker run \
        -d \
        --name shadowsocks-libev.simple-obfs \
        -p 12345:8388 \
        -p 12345:8388/udp \
        -e PASSWORD=password \
        -e METHOD=chacha20-ietf-poly1305
        gists/shadowsocks-libev.simple-obfs

#### Compose example with simple-obfs:

    shadowsocks:
      image: gists/shadowsocks-libev.simple-obfs
      ports:
        - "12345:8388/tcp"
        - "12345:8388/udp"
      environment:
        - PASSWORD=password
        - METHOD=chacha20-ietf-poly1305
      restart: always