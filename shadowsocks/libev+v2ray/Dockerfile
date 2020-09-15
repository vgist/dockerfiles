FROM gists/v2ray-plugin:latest AS builder

FROM gists/shadowsocks-libev:latest

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
