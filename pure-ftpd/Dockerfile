FROM alpine:3.9

ARG VERSION=1.0.48
ARG URL=https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-$VERSION.tar.gz

LABEL maintainer="zgist" \
        org.label-schema.name="Pure-FTPd" \
        org.label-schema.version=$VERSION

ENV PUBLIC_HOST         localhost
ENV MIN_PASV_PORT       30000
ENV MAX_PASV_PORT       30009
ENV UID                 1000
ENV GID                 1000

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                build-base \
                                curl \
                                openssl-dev \
                                tar && \
    cd /tmp && \
    curl -sSL $URL | tar xz --strip 1 && \
    ./configure --prefix=/usr \
                --sysconfdir=/etc/pureftpd \
                --without-humor \
                --with-minimal \
                --with-throttling \
                --with-puredb \
                --with-peruserlimits \
                --with-ratios \
                --with-tls && \
    make install-strip && \
    cd .. && \
    rm -rf /tmp/* && \
    apk del .build-deps

COPY entrypoint.sh /usr/bin/entrypoint.sh

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
