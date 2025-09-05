FROM gists/libtorrent:latest

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
    mkdir -p /tmp/rtorrent && cd $_ && \
    curl -sSL https://github.com/rakshasa/rtorrent/releases/download/v$VERSION/rtorrent-$VERSION.tar.gz | tar xz --strip 1 && \
    autoreconf -iv && \
    ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --mandir=/usr/share/man \
                --localstatedir=/var \
                --disable-debug \
                --with-xmlrpc-tinyxml2 && \
    make && make install && cd && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/rtorrent \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    rm -rf /tmp/*
