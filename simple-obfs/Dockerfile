FROM alpine:3.5
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ARG OBFS_VER=0.0.2
ARG OBFS_URL=https://github.com/shadowsocks/simple-obfs/archive/v$OBFS_VER.tar.gz

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     8443
ENV OBFS            http
ENV REMOTE_SERVER   127.0.0.1:8388

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                autoconf \
                                build-base \
                                curl \
                                libtool \
                                linux-headers \
                                tar && \
    mkdir -p /tmp/obfs && cd $_ && \
    curl -sSL $OBFS_URL | tar xz --strip 1 && \
    ./configure --prefix=/usr --disable-documentation && \
    make install && \

    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/obfs-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \

    apk del .build-deps && \
    cd / && rm -rf /tmp/*

USER nobody

EXPOSE $SERVER_PORT

CMD obfs-server --fast-open \
                -s $SERVER_ADDR \
                -p $SERVER_PORT \
                --obfs $OBFS \
                -r $REMOTE_SERVER
