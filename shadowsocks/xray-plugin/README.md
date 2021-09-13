Dockerfile <https://github.com/vgist/dockerfiles/blob/master/shadowsocks/xray-plugin/Dockerfile>

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

        xray-plugin:
            container_name: xray-plugin
            image: gists/xray-plugin
            ports:
                - "443:443/tcp"
            volumes:
                - ./certs:/certs
                - /etc/localtime:/etc/localtime:ro
            command: xray-plugin -server -localAddr 0.0.0.0 -localPort 443 -remoteAddr shadowsocks -remotePort 8388 -mode websocket -mux=1 -tls -host=domain.com -cert=/certs/domain.cert -key=/certs/domain.key
            depends_on:
                - shadowsocks
            networks:
                overlay:
            restart: always

    networks:
        overlay:
            driver: bridge
