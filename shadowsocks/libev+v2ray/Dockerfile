FROM gists/v2ray-plugin:1.3.0 AS builder

FROM gists/shadowsocks-libev:3.3.4

ENV SERVER_ADDR=0.0.0.0 \
    SERVER_PORT=8388 \
    METHOD=aes-128-gcm \
    TIMEOUT=300 \
    DNS_ADDR=8.8.8.8 \
    SS=ss-server \
    PLUGIN=v2ray-plugin \
    PLUGIN_OPTS=server \
    PASSWORD=

COPY --from=builder /usr/bin/v2ray-plugin /usr/bin/

CMD $SS \
    -s $SERVER_ADDR \
    -p $SERVER_PORT \
    -k ${PASSWORD:-$(hostname)} \
    -m $METHOD \
    -t $TIMEOUT \
    -d $DNS_ADDR \
    --no-delay \
    --plugin $PLUGIN \
    --plugin-opts $PLUGIN_OPTS
