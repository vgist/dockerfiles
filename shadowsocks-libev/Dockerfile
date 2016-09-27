FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ARG SS_VER=2.5.3
ARG SS_URL=https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8443
ENV PASSWORD=
ENV METHOD      aes-256-cfb
ENV TIMEOUT     300
ENV DNS_ADDR    8.8.8.8
ENV DNS_ADDR_2  8.8.4.4

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                tar \
                                autoconf \
                                build-base \
                                curl \
                                libtool \
                                linux-headers \
                                openssl-dev \
                                asciidoc \
                                xmlto && \
    cd /tmp && \
    curl -sSL $SS_URL | tar xz --strip 1 && \
    ./configure && \
    make install && \
    cd .. && \
    rm -rf /tmp/* && \
    apk del .build-deps

USER nobody

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

CMD ss-server -s $SERVER_ADDR \
              -p $SERVER_PORT \
              -k ${PASSWORD:-$(hostname)} \
              -m $METHOD \
              -t $TIMEOUT \
              --fast-open \
              -d $DNS_ADDR \
              -d $DNS_ADDR_2 \
              -U \
              -u
