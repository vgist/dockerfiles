FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV SS_VER 2.4.8
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR shadowsocks-libev-$SS_VER
ENV SS_DEP autoconf build-base curl libtool linux-headers openssl-dev asciidoc xmlto

RUN set -ex && \
    apk add -U --no-cache $SS_DEP && \
    curl -sSL $SS_URL | tar xz && \
    cd $SS_DIR && \
    ./configure && \
    make && make install && \
    cd .. && \
    rm -rf $SS_DIR && \
    apk del --purge $SS_DEP && \
    rm -rf /var/cache/apk/*

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8443
ENV PASSWORD=
ENV METHOD      aes-256-cfb
ENV TIMEOUT     300
ENV DNS_ADDR    8.8.8.8

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

CMD ss-server -s $SERVER_ADDR \
              -p $SERVER_PORT \
              -k ${PASSWORD:-$(hostname)} \
              -m $METHOD \
              -t $TIMEOUT \
              --fast-open \
              -d $DNS_ADDR \
              -u
