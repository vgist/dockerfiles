FROM alpine:edge
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV RESOLVER_IP 8.8.8.8
ENV RESOLVER_PORT 53
ENV LISTEN_IP 0.0.0.0
ENV LISTEN_PORT 443
ENV PROVIDER_NAME 2.dnscrypt-cert.easypi.info

ENV DNSCRYPT_VERSION 0.2.2
ENV DNSCRYPT_URL https://github.com/Cofyc/dnscrypt-wrapper/archive/v$DNSCRYPT_VERSION.tar.gz
ENV RUN_DEP libevent libsodium
ENV BUILD_DEP autoconf bsd-compat-headers build-base curl libevent-dev libexecinfo-dev libsodium-dev

RUN set -xe && \
    apk add -U --no-cache $RUN_DEP && \
    apk add --no-cache $BUILD_DEP && \
    curl -sSL $DNSCRYPT_URL | tar xz && \
    cd dnscrypt-wrapper-$DNSCRYPT_VERSION && \
    sed -i -e '59d' -e '46,57d' compat.h && \
    make configure && \
    ./configure --prefix=/usr && \
    make install && \
    cd .. && \
    apk del $BUILD_DEP && \
    rm -rf /var/cache/apk/* && \

    mkdir -p /var/lib/dnscrypt-wrapper && \
    cd /var/lib/dnscrypt-wrapper && \
    dnscrypt-wrapper --gen-provider-keypair > README.txt && \
    dnscrypt-wrapper --gen-crypt-keypair --crypt-secretkey-file=1.key && \
    dnscrypt-wrapper --gen-cert-file --crypt-secretkey-file=1.key --provider-cert-file=1.cert

WORKDIR /var/lib/dnscrypt-wrapper
VOLUME /var/lib/dnscrypt-wrapper

EXPOSE $LISTEN_PORT/tcp $LISTEN_PORT/udp

CMD dnscrypt-wrapper --resolver-address=${RESOLVER_IP}:${RESOLVER_PORT} \
                     --listen-address=${LISTEN_IP}:${LISTEN_PORT} \
                     --provider-name=${PROVIDER_NAME} \
                     --crypt-secretkey-file=1.key \
                     --provider-cert-file=1.cert \
                     --verbose
