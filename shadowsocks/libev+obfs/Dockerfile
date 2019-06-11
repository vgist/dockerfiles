FROM alpine:3.9

ARG SS_VER=3.3.0
ARG SS_URL=https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$SS_VER/shadowsocks-libev-$SS_VER.tar.gz
ARG OBFS_VER=0.0.5
ARG OBFS_URL=https://github.com/shadowsocks/simple-obfs/archive/v$OBFS_VER.tar.gz

LABEL maintainer="zgist" \
        org.label-schema.name="shadowsocks-libev.simple-obfs" \
        org.label-schema.version=$VERSION

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD=
ENV METHOD      aes-128-gcm
ENV TIMEOUT     300
ENV DNS_ADDR    8.8.8.8

ENV PLUGIN      obfs-server
ENV PLUGIN_OPTS obfs=http

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                autoconf \
                                automake \
                                build-base \
                                curl \
                                libev-dev \
                                libtool \
                                linux-headers \
                                libsodium-dev \
                                openssl-dev \
                                mbedtls-dev \
                                pcre-dev \
                                tar \
                                c-ares-dev && \
    mkdir -p /tmp/ss /tmp/obfs && \
    cd /tmp/ss && \
    curl -sSL $SS_URL | tar xz --strip 1 && \
    ./configure --prefix=/usr --disable-documentation && \
    make install && \
    cd /tmp/obfs && \
    curl -sSL $OBFS_URL | tar xz --strip 1 && \
    curl -sSL https://github.com/shadowsocks/libcork/archive/29d7cbafc4b983192baeb0c962ab1ff591418f56.tar.gz | tar xz --strip 1 -C libcork && \
    ./autogen.sh && \
    ./configure --prefix=/usr --disable-documentation && \
    make install && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/ss-* /usr/bin/obfs-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    cd / && rm -rf /tmp/*

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

CMD ss-server \
    -a nobody \
    -s $SERVER_ADDR \
    -p $SERVER_PORT \
    -k ${PASSWORD:-$(hostname)} \
    -m $METHOD \
    -t $TIMEOUT \
    -d $DNS_ADDR \
    --no-delay \
    -u \
    --plugin $PLUGIN \
    --plugin-opts $PLUGIN_OPTS
