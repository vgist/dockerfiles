FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ARG PUREFTPD_VERSION=1.0.43
ARG URL=http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-$PUREFTPD_VERSION.tar.gz

ENV PUBLIC_HOST         localhost
ENV MIN_PASV_PORT       30000
ENV MAX_PASV_PORT       30009

RUN set -ex && \
    apk add --no-cache --virtual .build-deps build-base curl tar && \
    cd /tmp && \
    curl -sSL $URL | tar xz --strip 1 && \

    ./configure --prefix=/usr \
                --without-humor \
                --with-minimal \
                --with-throttling \
                --with-puredb \
                --with-rfc2640 \
                --with-peruserlimits \
                --with-ratios \
                --with-welcomemsg && \
    make install-strip && \
    cd .. && \
    rm -rf /tmp/* && \
    apk del .build-deps && \

    addgroup -g 1000 -S ftpuser && \
    adduser -u 1000 -G ftpuser -h /home/ftpuser -D -s /sbin/nologin ftpuser

COPY entrypoint.sh /usr/bin/entrypoint.sh

VOLUME /home/ftpuser

EXPOSE 21 $MIN_PASV_PORT-$MAX_PASV_PORT

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD /usr/sbin/pure-ftpd \
                        -P $PUBLIC_HOST \
                        -p $MIN_PASV_PORT:MAX_PASV_PORT \
                        -l puredb:/etc/pureftpd.pdb \
                        -E \
                        -j \
                        -R
