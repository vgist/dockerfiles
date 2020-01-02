![](https://images.microbadger.com/badges/version/gists/v2ray-plugin.svg) ![](https://images.microbadger.com/badges/image/gists/v2ray-plugin.svg) ![](https://img.shields.io/docker/stars/gists/v2ray-plugin.svg) ![](https://img.shields.io/docker/pulls/gists/v2ray-plugin.svg)


#### Environment:

| Environment | Default value  |
|-------------|----------------|
| LOCAL_ADDR  | 0.0.0.0        |
| LOCAL_PORT  | 8388           |
| REMOTE_ADDR | 0.0.0.0        |
| REMOTE_PORT | 1080           |
| MODE        | websocket      |
| HOST        | cloudfront.com |
| ARGS        |                |

#### Compose example with shadowsocks-libev on server:

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

#### Compose example with shadowsocks-libev on client:

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

#### Custom:

    version: '3'

    services:
        shadowsocks:
            container_name: shadowsocks
            image: gists/shadowsocks-libev
            networks:
                overlay:
            command: your command here
            restart: always

          v2ray-plugin:
            container_name: v2ray-plugin
            image: gists/v2ray-plugin
            ports:
                - "12345:8388/tcp"
            command: your command here
            depends_on:
                - shadowsocks
            networks:
                overlay:
            restart: always

    networks:
        overlay:
            driver: bridge
