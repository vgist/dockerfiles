FROM alpine:3.12

ARG VERSION

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
        boost-dev \
        boost-system \
        boost-thread \
        ca-certificates \
        curl \
        g++ \
        libressl-dev \
        make \
        qt5-qtbase \
        qt5-qttools-dev \
        tar && \
    mkdir -p /tmp/libtorrent-rasterbar && \
    cd /tmp/libtorrent-rasterbar/ && \
    curl -sSL https://github.com/arvidn/libtorrent/releases/download/libtorrent_${VERSION//./_}/libtorrent-rasterbar-$VERSION.tar.gz | tar xz --strip 1 && \
    ./configure --prefix=/usr && \
    make -j$(nproc) && make install-strip && \
    cd / && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/lib/libtorrent-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    rm -rf /tmp/*
