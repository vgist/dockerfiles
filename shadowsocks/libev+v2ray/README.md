![](https://images.microbadger.com/badges/version/gists/shadowsocks-libev:v2ray-plugin-latest.svg) ![](https://images.microbadger.com/badges/image/gists/shadowsocks-libev:v2ray-plugin-latest.svg) ![](https://img.shields.io/docker/stars/gists/shadowsocks-libev.svg) ![](https://img.shields.io/docker/pulls/gists/shadowsocks-libev.svg)

#### Environment:

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

#### Creating an instance:

On server:

    docker run \
        -d \
        --name ss-v2ray \
        -p 80:8388 \
        -e PASSWORD=password \
        -e METHOD=aes-128-gcm \
        gists/shadowsocks-libev.v2ray-plugin

On client:

    docker run \
        -d \
        --name ss-v2ray \
        -p 80:8388 \
        -e PASSWORD=password \
        -e METHOD=aes-128-gcm \
        -e SS=ss-local \
        -e PLUGIN_OPTS="mode=websocket;host=domain.com"
        gists/shadowsocks-libev.v2ray-plugin

#### Compose example with v2ray-plugin:

    shadowsocks:
      image: gists/shadowsocks-libev.v2ray-plugin
      ports:
        - "80:8388/tcp"
      environment:
        - PASSWORD=password
        - METHOD=aes-128-gcm
      restart: always

#### custom:

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
