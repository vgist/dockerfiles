FROM gists/shadowsocks-libev:3.3.4

ARG VERSION=1.2.0

LABEL maintainer="zgist" \
        org.label-schema.name="shadowsocks-libev.v2ray-plugin" \
        org.label-schema.version=$VERSION

ENV SS=ss-server \
    PLUGIN=v2ray-plugin \
    PLUGIN_OPTS=server

# Let's roll
RUN set -xe && \
    apk add --no-cache \
        --virtual .build-deps \
        curl \
        git \
        go \
        build-base \
        go \
        upx && \
    mkdir -p /tmp/plugin && \
    cd /tmp/plugin && \
    curl -sSL https://github.com/shadowsocks/v2ray-plugin/archive/v$VERSION.tar.gz | \
    tar xz --strip 1 && \
    go mod download && \
    CGO_ENABLED=0 \
        go build -v -ldflags "-X main.VERSION=$VERSION -s -w" -gcflags "" -o /usr/bin/v2ray-plugin && \
    cd / && upx --lzma /usr/bin/v2ray-plugin && \
    apk del .build-deps && \
    rm -rf /root/go /root/.cache /root/.ash_history /tmp/plugin

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
