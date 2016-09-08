FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ARG PUREFTPD_VERSION=1.0.43

ENV PUBLIC_HOST         localhost

RUN set -ex && \
    apk add --no-cache --virtual .build-deps build-base curl && \
    curl -sSL http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-$PUREFTPD_VERSION.tar.gz | tar xz && \
    cd pure-ftpd-$PUREFTPD_VERSION && \

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
    rm -rf pure-ftpd-$PUREFTPD_VERSION && \
    apk del .build-deps && \

    addgroup -g 1000 -S ftpuser && \
    adduser -u 1000 -G ftpuser -h /home/ftpuser -D -s /sbin/nologin ftpuser

COPY entrypoint.sh /usr/bin/entrypoint.sh

VOLUME /home/ftpuser

EXPOSE 21 30000-30009

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD /usr/sbin/pure-ftpd \
                        -P $PUBLIC_HOST \
                        -p 30000:30009 \
                        -l puredb:/etc/pureftpd.pdb \
                        -C 10 \
                        -E \
                        -j \
                        -R
