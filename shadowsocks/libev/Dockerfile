FROM alpine:3.11

ARG VERSION=3.3.3

LABEL maintainer="zgist" \
        org.label-schema.name="Shadowsocks-libev" \
        org.label-schema.version=$VERSION

ENV SERVER_ADDR=0.0.0.0 \
    SERVER_PORT=8388 \
    METHOD=aes-128-gcm \
    TIMEOUT=300 \
    DNS_ADDR=8.8.8.8 \
    PASSWORD=

RUN set -ex && \
    apk add --no-cache \
        --virtual .build-deps \
        autoconf \
        build-base \
        curl \
        libev-dev \
        libtool \
        linux-headers \
        libsodium-dev \
        mbedtls-dev \
        pcre-dev \
        tar \
        c-ares-dev && \
    mkdir -p /tmp/ss && \
    cd /tmp/ss && \
    curl -sSL https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$VERSION/shadowsocks-libev-$VERSION.tar.gz | \
    tar xz --strip 1 && \
    ./configure --prefix=/usr --disable-documentation && \
    make install && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/ss-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    cd / && rm -rf /tmp/*

EXPOSE $SERVER_PORT

CMD ss-server \
    -a nobody \
    -s $SERVER_ADDR \
    -p $SERVER_PORT \
    -k ${PASSWORD:-$(hostname)} \
    -m $METHOD \
    -t $TIMEOUT \
    -d $DNS_ADDR \
    --no-delay \
    -u
