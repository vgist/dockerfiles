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
        cmake \
        curl \
        git \
        libev-dev \
        libcap \
        libtool \
        linux-headers \
        libsodium-dev \
        mbedtls2-dev \
        pcre2-dev \
        tar \
        c-ares-dev && \
    git clone https://github.com/shadowsocks/shadowsocks-libev.git /tmp/ss && \
    cd /tmp/ss && git checkout v$VERSION && \
    git submodule update --init --recursive && \
    cmake -B builddir -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_STATIC:BOOL=OFF \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr && \
    cmake --build builddir -j$(nproc) && \
    cmake --install builddir && \
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
