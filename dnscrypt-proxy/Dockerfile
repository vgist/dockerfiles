FROM alpine:edge
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV LOCAL_IP 0.0.0.0
ENV LOCAL_PORT 5353
ENV RESOLVER_IP 178.216.201.222
ENV RESOLVER_PORT 2053
ENV PROVIDER_NAME 2.dnscrypt-cert.soltysiak.com
ENV PROVIDER_KEY 25C4:E188:2915:4697:8F9C:2BBD:B6A7:AFA4:01ED:A051:0508:5D53:03E7:1928:C066:8F21

RUN set -xe && \
    apk add --no-cache dnscrypt-proxy && \
    rm -rf /var/cache/apk/*

EXPOSE $LOCAL_PORT/tcp $LOCAL_PORT/udp

CMD dnscrypt-proxy --local-address=$LOCAL_IP:$LOCAL_PORT \
                   --provider-name=$PROVIDER_NAME \
                   --provider-key=$PROVIDER_KEY \
                   --resolver-address=$RESOLVER_IP:$RESOLVER_PORT
