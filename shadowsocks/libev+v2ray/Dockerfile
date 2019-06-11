FROM alpine:3.9

ARG VERSION=1.1.0
ARG REPO=github.com/shadowsocks/v2ray-plugin
ARG URL=https://$REPO/archive/v$VERSION.tar.gz
ARG SS_VER=3.3.0
ARG SS_URL=https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$SS_VER/shadowsocks-libev-$SS_VER.tar.gz

LABEL maintainer="zgist" \
        org.label-schema.name="shadowsocks-libev.v2ray-plugin" \
        org.label-schema.version=$VERSION

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 80
ENV PASSWORD=
ENV METHOD      aes-128-gcm
ENV TIMEOUT     300
ENV DNS_ADDR    8.8.8.8

ENV SS          ss-server
ENV PLUGIN      v2ray-plugin
ENV PLUGIN_OPTS server

# Let's roll
RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
                                autoconf \
                                build-base \
                                c-ares-dev \
                                curl \
                                git \
                                go \
                                libev-dev \
                                libtool \
                                linux-headers \
                                libsodium-dev \
                                mbedtls-dev \
                                pcre-dev \
                                tar \
                                upx && \
    mkdir -p /tmp/ss /tmp/plugin && \
    cd /tmp/ss && \
    curl -sSL $SS_URL | tar xz --strip 1 && \
    ./configure --prefix=/usr --disable-documentation && \
    make install && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/ss-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    cd /tmp/plugin && curl -sSL $URL | tar xz --strip 1 && \
    go mod download && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
        go build -v -ldflags "-X main.VERSION=$VERSION -s -w" -gcflags "" -o /usr/bin/v2ray-plugin && \
    cd / && \
    upx --best /usr/bin/v2ray-plugin && \
    upx --best /usr/bin/ss-* && \
    apk del .build-deps && \
    rm -rf /root/go /root/.cache /root/.ash_history /tmp/ss /tmp/plugin

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
