FROM alpine:3.17

ARG VERSION

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
        git \
        boost-dev \
        cmake \
        curl \
        g++ \
        openssl-dev \
        make \
        tar && \
    mkdir -p /tmp/libtorrent-rasterbar && \
    cd /tmp/libtorrent-rasterbar/ && \
    curl -sSL https://github.com/arvidn/libtorrent/releases/download/v$VERSION/libtorrent-rasterbar-$VERSION.tar.gz | tar xz --strip 1 && \
    cmake -Wno-dev -B builddir \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_STANDARD=17 \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib && \
    cmake --build builddir --parallel `nproc` && \
    cmake --install builddir && \
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
