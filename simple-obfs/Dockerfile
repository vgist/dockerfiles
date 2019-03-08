FROM alpine:3.9

ARG VERSION=0.0.5
ARG OBFS_URL=https://github.com/shadowsocks/simple-obfs/archive/v$VERSION.tar.gz

LABEL maintainer="zgist" \
        org.label-schema.name="Simple-obfs" \
        org.label-schema.version=$VERSION

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV DNS_SERVER  8.8.8.8
ENV OBFS_OPTS   http
ENV FORWARD     127.0.0.1:8388
ENV FAILOVER    www.163.com:80

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                autoconf \
                                automake \
                                build-base \
                                curl \
                                libev-dev \
                                libtool \
                                linux-headers \
                                openssl-dev \
                                pcre-dev \
                                tar && \
    mkdir -p /tmp/obfs && \
    cd /tmp/obfs && \
    curl -sSL $OBFS_URL | tar xz --strip 1 && \
    curl -sSL https://github.com/shadowsocks/libcork/archive/29d7cbafc4b983192baeb0c962ab1ff591418f56.tar.gz | tar xz --strip 1 -C libcork && \
    ./autogen.sh && \
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

EXPOSE $SERVER_PORT

CMD obfs-server --fast-open \
            -a nobody \
            -s $SERVER_ADDR \
            -p $SERVER_PORT \
            -d $DNS_SERVER \
            --obfs $OBFS_OPTS \
            -r $FORWARD
