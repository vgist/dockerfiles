FROM alpine:3.12

ARG VERSION

ENV RESOLVER_IP=8.8.8.8 \
    RESOLVER_PORT=53 \
    LISTEN_IP=0.0.0.0 \
    LISTEN_PORT=443 \
    PROVIDER_NAME=2.dnscrypt-cert.easypi.info

RUN set -xe && \
    apk add --no-cache \
        --virtual .run-deps \
        libevent \
        libsodium && \
    apk add --no-cache \
        --virtual .build-deps \
        autoconf \
        bsd-compat-headers \
        build-base \
        curl \
        libevent-dev \
        libexecinfo-dev \
        libsodium-dev && \
    mkdir /tmp/build && cd /tmp/build && \
    curl -sSL https://github.com/Cofyc/dnscrypt-wrapper/archive/v$VERSION.tar.gz | \
    tar xz --strip 1 && \
    make configure && \
    ./configure --prefix=/usr && \
    make -j$(nproc) && make install && \
    cd / && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/sbin/dnscrypt-wrapper \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    rm -rf /tmp/build && \
    mkdir -p /var/lib/dnscrypt-wrapper

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/lib/dnscrypt-wrapper
VOLUME ["/var/lib/dnscrypt-wrapper"]

EXPOSE $LISTEN_PORT/tcp $LISTEN_PORT/udp

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD /usr/sbin/dnscrypt-wrapper \
        --resolver-address=${RESOLVER_IP}:${RESOLVER_PORT} \
        --listen-address=${LISTEN_IP}:${LISTEN_PORT} \
        --provider-name=${PROVIDER_NAME} \
        --crypt-secretkey-file=1.key \
        --provider-cert-file=1.cert \
        --verbose
