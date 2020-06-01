FROM alpine:3.12

ARG VERSION

ENV PUBLIC_HOST=localhost \
    MIN_PASV_PORT=30000 \
    MAX_PASV_PORT=30009 \
    UID=1000 \
    GID=1000

COPY rootfs /
RUN set -ex && \
    apk add --no-cache \
        --virtual .build-deps \
        build-base \
        curl \
        openssl-dev \
        tar && \
    cd /tmp && \
    curl -sSL https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-$VERSION.tar.gz | \
    tar xz --strip 1 && \
    patch -p1 src/ftpd.c minimal.patch && \
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc/pureftpd \
        --without-humor \
        --with-minimal \
        --with-throttling \
        --with-puredb \
        --with-peruserlimits \
        --with-ratios \
        --with-tls && \
    make install-strip && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/sbin/pure-* /usr/bin/pure-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    cd / && rm -rf /tmp/* && \
    apk del .build-deps

VOLUME /home/ftpuser /etc/pureftpd

EXPOSE 21 $MIN_PASV_PORT-$MAX_PASV_PORT

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD /usr/sbin/pure-ftpd \
        -P $PUBLIC_HOST \
        -p $MIN_PASV_PORT:$MAX_PASV_PORT \
        -l puredb:/etc/pureftpd/pureftpd.pdb \
        -E \
        -j \
        -R
