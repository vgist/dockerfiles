FROM alpine:3

ARG VERSION

ENV SERVER_ADDR=0.0.0.0 \
    SERVER_PORT=8388 \
    METHOD=aes-128-gcm \
    TIMEOUT=300 \
    DNS_ADDR=8.8.8.8

RUN set -ex && \
    apk add --no-cache \
        --virtual .build-deps \
        autoconf \
        build-base \
        curl \
        libev-dev \
        libcap \
        libtool \
        linux-headers \
        libsodium-dev \
        mbedtls-dev \
        pcre-dev \
        tar \
        c-ares-dev && \
    mkdir -p /tmp/ss && \
    cd /tmp/ss && \
    curl -sSL https://github.com/shadowsocks/shadowsocks-libev/releases/latest/download/shadowsocks-libev-$VERSION.tar.gz | \
    tar xz --strip 1 && \
    for i in "89b5f98" "5617841" "920dbac" "36d9993" "b68157e" "cfe0c2c" "13f4720" "7e5922a" "e04b73d" "ed23402" "4bbbe21" "8bcffa5" "a19328a" "49ead5e" "0a7d178" "abcf85e" "b911755" "46382c2" "0c23224" "1630764" "d61d09a" "3bcf258"; do \
        curl -sSL https://github.com/shadowsocks/shadowsocks-libev/commit/$i.patch | patch -p1; \
    done && \
    ./configure --prefix=/usr --disable-documentation && \
    make -j `nproc` install && \
    ls /usr/bin/ss-* | xargs -n1 setcap 'cap_net_bind_service+ep' && \
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

SHELL ["/bin/sh", "-c"]

CMD ss-server \
    -s $SERVER_ADDR \
    -p $SERVER_PORT \
    -k ${PASSWORD:-$(hostname)} \
    -m $METHOD \
    -t $TIMEOUT \
    -d $DNS_ADDR \
    --no-delay \
    -u
