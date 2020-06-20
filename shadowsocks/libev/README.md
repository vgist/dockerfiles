![](https://images.microbadger.com/badges/version/gists/shadowsocks-libev.svg) ![](https://images.microbadger.com/badges/image/gists/shadowsocks-libev.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/shadowsocks/libev/>

Automatically built by Github Actions

### Environment:

| Environment | Default value |
|-------------|---------------|
| SERVER_ADDR | 0.0.0.0       |
| SERVER_PORT | 8388          |
| PASSWORD    | $(hostname)   |
| METHOD      | aes-128-gcm   |
| TIMEOUT     | 300           |
| DNS_ADDR    | 8.8.8.8       |

### Creating an instance:

    docker run \
        -d \
        --name shadowsocks \
        -p 12345:8388 \
        -p 12345:8388/udp \
        -e PASSWORD=password \
        -e METHOD=aes-128-gcm
        gists/shadowsocks-libev

### Compose example:

    shadowsocks:
        image: gists/shadowsocks-libev
        ports:
            - "12345:8388/tcp"
            - "12345:8388/udp"
        environment:
            - PASSWORD=password
            - METHOD=aes-128-gcm
      restart: always

### Compose file with custom command

    shadowsocks:
        image: gists/shadowsocks-libev
        ports:
            - "12345:8388/tcp"
            - "12345:8388/udp"
        command: ss-server -s 0.0.0.0 -p 12345 -k password -m chacha20-ietf-poly1305 -t 300 -d 8.8.8.8 --no-delay -u
        restart: always

### Compose example with v2ray-plugin

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

### v2ray-plugin-latest:

##### v2ray-plugin-latest Environment:

| Environment | Default value |
|-------------|---------------|
| SERVER_ADDR | 0.0.0.0       |
| SERVER_PORT | 8388          |
| PASSWORD    | $(hostname)   |
| METHOD      | aes-128-gcm   |
| TIMEOUT     | 300           |
| DNS_ADDR    | 8.8.8.8       |
| SS          | ss-server     |
| PLUGIN      | v2ray-plugin  |
| PLUGIN_OPTS | server        |

##### Creating an instance:

    docker run \
        -d \
        --name ss-v2ray \
        -p 80:8388 \
        -e PASSWORD=password \
        -e METHOD=aes-128-gcm \
        gists/shadowsocks-libev:v2ray-plugin-latest

##### Compose example:

    shadowsocks:
      image: gists/shadowsocks-libev:v2ray-plugin-latest
      ports:
        - "80:8388/tcp"
      environment:
        - PASSWORD=password
        - METHOD=aes-128-gcm
      restart: always

##### Custom:

    shadowsocks:
      image: gists/shadowsocks-libev:v2ray-plugin-latest
      ports:
        - "443:443/tcp"
      volumes:
        - ./config.json:/config.json
        - ./certs:/certs
      command: ss-server -c /config.json
      restart: always

config.json:

    {
        "server":"domain.com",
        "server_port":443,
        "password":"password",
        "timeout":"60",
        "method":"aes-128-gcm",
        "mode":"tcp_only",
        "no_delay": true,
        "nameserver":"8.8.8.8",
        "plugin":"v2ray-plugin",
        "plugin_opts":"server;tls;host=domain.com;cert=/certs/domain.cert;key=/certs/domain.key"
    }
