![](https://images.microbadger.com/badges/version/gists/shadowsocks-libev.svg) ![](https://images.microbadger.com/badges/image/gists/shadowsocks-libev.svg) ![](https://img.shields.io/docker/stars/gists/shadowsocks-libev.svg) ![](https://img.shields.io/docker/pulls/gists/shadowsocks-libev.svg)

#### Environment:

| Environment | Default value |
|-------------|---------------|
| SERVER_ADDR | 0.0.0.0       |
| SERVER_PORT | 8388          |
| PASSWORD    | $(hostname)   |
| METHOD      | aes-128-gcm   |
| TIMEOUT     | 300           |
| DNS_ADDR    | 8.8.8.8       |

#### Creating an instance:

    docker run \
        -d \
        --name shadowsocks \
        -p 12345:8388 \
        -p 12345:8388/udp \
        -e PASSWORD=password \
        -e METHOD=aes-128-gcm
        gists/shadowsocks-libev

#### Compose example:

    shadowsocks:
        image: gists/shadowsocks-libev
        ports:
            - "12345:8388/tcp"
            - "12345:8388/udp"
        environment:
            - PASSWORD=password
            - METHOD=aes-128-gcm
      restart: always

#### Compose file with custom command

    shadowsocks:
        image: gists/shadowsocks-libev
        ports:
            - "12345:8388/tcp"
            - "12345:8388/udp"
        command: ss-server -s 0.0.0.0 -p 12345 -k password -m chacha20-ietf-poly1305 -t 300 -d 8.8.8.8 --no-delay -u
        restart: always

#### Compose example with v2ray-plugin

##### on server

    version: '3'

    services:
        shadowsocks:
            container_name: shadowsocks
            image: gists/shadowsocks-libev
            networks:
                overlay:
            environment:
              - PASSWORD=passowrd
              - METHOD=aes-128-gcm
            restart: always

        v2ray-plugin:
            container_name: v2ray-plugin
            image: gists/v2ray-plugin
            ports:
                - "12345:8388/tcp"
            environment:
                - REMOTE_ADDR=shadowsocks
                - REMOTE_PORT=1080
                - ARGS=-server
            depends_on:
                - shadowsocks
            networks:
                overlay:
            restart: always

    networks:
        overlay:
            driver: bridge

##### on client

    version: '3'

    services:
        shadowsocks:
            container_name: shadowsocks
            image: gists/shadowsocks-libev
            networks:
                overlay:
            command: ss-local -s server_ip -p server_port -l 1080 -k password -m aes-128-gcm --no-delay -u
            restart: always

          v2ray-plugin:
            container_name: v2ray-plugin
            image: gists/v2ray-plugin
            ports:
                - "12345:8388/tcp"
            environment:
                - REMOTE_ADDR=shadowsocks
                - REMOTE_PORT=1080
                - LOCAL_ADDR=0.0.0.0
                - LOCAL_PORT=8388
            depends_on:
                - shadowsocks
            networks:
                overlay:
            restart: always

    networks:
        overlay:
            driver: bridge
