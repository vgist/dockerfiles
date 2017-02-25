![](https://img.shields.io/badge/shadowsocks--libev-3.0.3-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.5-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/shadowsocks-libev.svg) ![](https://img.shields.io/docker/pulls/gists/shadowsocks-libev.svg)

- tag: [latest](https://github.com/iHavee/dockerfiles/blob/master/shadowsocks/libev/Dockerfile)
- tag: [over-obfs](https://github.com/iHavee/dockerfiles/blob/ss-obfs/shadowsocks/libev/Dockerfile)
- tag: [2.5.6](https://github.com/iHavee/dockerfiles/blob/ss-2.5.6/shadowsocks/libev/Dockerfile)

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
        --name shadowsocks \
        -p 8388:8388 \
        -p 8388:8388/udp \
        -e PASSWORD=password \
        -e METHOD=chacha20-ietf-poly1305
        gists/shadowsocks-libev

#### Compose example:

    shadowsocks:
      image: gists/shadowsocks-libev
      ports:
        - "8388:8388/tcp"
        - "8388:8388/udp"
      environment:
        - PASSWORD=password
        - METHOD=chacha20-ietf-poly1305
      restart: always
