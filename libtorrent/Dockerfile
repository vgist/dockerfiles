FROM alpine:3

ARG VERSION

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
        autoconf \
        automake \
        build-base \
        curl \
        curl-dev \
        libcurl \
        libsigc++3-dev \
        libtool \
        linux-headers \
        ncurses-dev \
        openssl-dev \
        pkgconf \
        tinyxml2-dev \
        zlib-dev \
        tar && \
    mkdir -p /tmp/libtorrent && cd /tmp/libtorrent && \
    curl -sSL https://github.com/rakshasa/libtorrent/archive/refs/tags/v$VERSION.tar.gz | tar xz --strip 1 && \
    autoreconf -iv && \
    ./configure --prefix=/usr \
                --disable-debug \
                --disable-instrumentation && \
    make && make install && cd && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/lib/libtorrent.so.* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    rm -rf /tmp/*
