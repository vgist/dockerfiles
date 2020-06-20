![](https://images.microbadger.com/badges/version/gists/v2ray-plugin.svg) ![](https://images.microbadger.com/badges/image/gists/v2ray-plugin.svg)

Dockerfile <https://github.com/vgist/dockerfiles/blob/master/shadowsocks/v2ray-plugin/Dockerfile>

Automatically built by Github Actions

#### Compose example with shadowsocks-libev on server:

    version: '3'

    services:
        shadowsocks:
            container_name: shadowsocks
            image: gists/shadowsocks-libev
            environment:
              - PASSWORD=passowrd
              - METHOD=aes-128-gcm
              - SERVER_PORT=8388
            volumes:
                - /etc/localtime:/etc/localtime:ro
            networks:
                overlay:
            restart: always

        v2ray-plugin:
            container_name: v2ray-plugin
            image: gists/v2ray-plugin
            ports:
                - "443:443/tcp"
            volumes:
                - ./certs:/certs
                - /etc/localtime:/etc/localtime:ro
            command: v2ray-plugin -server -localAddr 0.0.0.0 -localPort 443 -remoteAddr shadowsocks -remotePort 8388 -mode websocket -mux=1 -tls -host=domain.com -cert=/certs/domain.cert -key=/certs/domain.key
            depends_on:
                - shadowsocks
            networks:
                overlay:
            restart: always

    networks:
        overlay:
            driver: bridge
