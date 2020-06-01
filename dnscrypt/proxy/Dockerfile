FROM alpine:3.12

ARG VERSION

ENV LOCAL_PORT     5353

RUN set -xe && \
    apk add --no-cache dnscrypt-proxy

USER dnscrypt

EXPOSE $LOCAL_PORT/tcp $LOCAL_PORT/udp

CMD /usr/bin/dnscrypt-proxy \
    -config /etc/dnscrypt-proxy/dnscrypt-proxy.toml
