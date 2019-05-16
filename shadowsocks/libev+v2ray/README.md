![](https://images.microbadger.com/badges/version/gists/shadowsocks-libev.v2ray-plugin.svg) ![](https://images.microbadger.com/badges/image/gists/shadowsocks-libev.v2ray-plugin.svg) ![](https://img.shields.io/docker/stars/gists/shadowsocks-libev.v2ray-plugin.svg) ![](https://img.shields.io/docker/pulls/gists/shadowsocks-libev.v2ray-plugin.svg)

#### Environment:

| Environment | Default value |
|-------------|---------------|
| SERVER_ADDR | 0.0.0.0       |
| SERVER_PORT | 80            |
| PASSWORD    | $(hostname)   |
| METHOD      | aes-128-gcm   |
| TIMEOUT     | 300           |
| DNS_ADDR    | 8.8.8.8       |
| SS          | ss-server     |
| PLUGIN      | v2ray-plugin  |
| PLUGIN_OPTS | server        |

#### Creating an instance:

On server:

    docker run \
        -d \
        --name shadowsocks-libev.v2ray-plugin \
        -p 80:80 \
        -e PASSWORD=password \
        -e METHOD=aes-128-gcm
        gists/shadowsocks-libev.v2ray-plugin

On client:

    docker run \
        -d \
        --name shadowsocks-libev.v2ray-plugin \
        -p 80:80 \
        -e PASSWORD=password \
        -e METHOD=aes-128-gcm \
        -e SS=ss-local
        -e PLUGIN_OPTS="mode=websocket;host=domain.com"
        gists/shadowsocks-libev.v2ray-plugin

#### Compose example with v2ray-plugin:

    shadowsocks:
      image: gists/shadowsocks-libev.v2ray-plugin
      ports:
        - "80:80/tcp"
      environment:
        - PASSWORD=password
        - METHOD=aes-128-gcm
      restart: always

#### Advanced custom

    shadowsocks:
      image: gists/shadowsocks-libev.v2ray-plugin
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
