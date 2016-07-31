FROM alpine:edge
MAINTAINER kev <noreply@easypi.info>

ENV LOCALIP 0.0.0.0
ENV LOCALPORT 5353
ENV RESOLVERIP 178.216.201.222
ENV RESOLVERPORT 2053
ENV PROVIDER_NAME 2.dnscrypt-cert.soltysiak.com
ENV PROVIDER_KEY 25C4:E188:2915:4697:8F9C:2BBD:B6A7:AFA4:01ED:A051:0508:5D53:03E7:1928:C066:8F21

RUN set -xe && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add -U --no-cache dnscrypt-proxy && \
    rm -rf /var/cache/apk/*

EXPOSE $LOCALPORT/tcp $LOCALPORT/udp

CMD dnscrypt-proxy --local-address=$LOCALIP:$LOCALPORT \
                   --provider-name=$PROVIDER_NAME \
                   --provider-key=$PROVIDER_KEY \
                   --resolver-address=$RESOLVERIP:$RESOLVERPORT
