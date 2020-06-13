FROM --platform=$TARGETPLATFORM gists/libtorrent-rasterbar:1.2.7

ARG VERSION

ENV PEER_PORT=6881 \
    WEB_PORT=8080 \
    UID=1000 \
    GID=1000

RUN set -ex && \
    apk add --no-cache su-exec && \
    apk add --no-cache --virtual .build-deps \
        boost-dev \
        boost-system \
        boost-thread \
        ca-certificates \
        curl \
        g++ \
        libcap \
        libressl-dev \
        make \
        qt5-qtbase \
        qt5-qttools-dev \
        tar && \
    mkdir -p /tmp/qbittorrent && \
    cd /tmp/qbittorrent && \
    curl -sSL https://github.com/qbittorrent/qBittorrent/archive/release-$VERSION.tar.gz | tar xz --strip 1 && \
    ./configure --prefix=/usr --disable-gui --disable-stacktrace && \
    make -j$(nproc) && make install && \
    # Set capability to bind privileged ports as non-root user for qbittorrent-nox
    setcap 'cap_net_bind_service=+ep' /usr/bin/qbittorrent-nox && \
    cd / && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/qbittorrent* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    rm -rf /tmp/*

COPY rootfs /

EXPOSE $PEER_PORT $PEER_PORT/udp $WEB_PORT

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/bin/qbittorrent-nox"]
