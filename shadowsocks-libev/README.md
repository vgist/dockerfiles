![](https://img.shields.io/badge/shadowsocks--libev-3.0.2-brightgreen.svg) ![](https://img.shields.io/badge/simple--obfs-0.0.2-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.5-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/shadowsocks-libev.svg) ![](https://img.shields.io/docker/pulls/gists/shadowsocks-libev.svg)

#### Environment:

| Environment | Default value |
|-------------|---------------|
| SERVER_ADDR | 0.0.0.0       |
| SERVER_PORT | 8443          |
| PASSWORD    | $(hostname)   |
| METHOD      | aes-128-gcm   |
| TIMEOUT     | 300           |
| DNS_ADDR    | 8.8.8.8       |
| DNS_ADDR_2  | 8.8.4.4       |
| PLUGIN      | obfs-server   |
| PLUGIN_OPTS | obfs=http     |

#### Creating an instance:

    docker run \
        -d \
        --name shadowsocks \
        -p 8443:8443 \
        -p 8443:8443/udp \
        -e PASSWORD=EQdFUYal \
        -e METHOD=aes-128-gcm
        gists/shadowsocks-libev

#### Compose example:

    shadowsocks:
      image: gists/shadowsocks-libev
      ports:
        - "8443:8443/tcp"
        - "8443:8443/udp"
      environment:
        - PASSWORD=EQdFUYal
        - METHOD=aes-128-gcm
      restart: always

