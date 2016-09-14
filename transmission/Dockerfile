FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV RPC_PORT    9091
ENV PEERPORT    51413
ENV USERNAME    username
ENV PASSWORD=

# Let's roll
RUN set -xe && \
    apk add --no-cache transmission-daemon && \

    mkdir -p /data/.config && \
    mkdir -p /data/.incompletes && \
    mkdir -p /data/downloads && \
    mkdir -p /data/watch && \
    chown -R transmission:transmission /data

COPY settings.json /data/.config/settings.json

VOLUME /data/downloads

WORKDIR /data

EXPOSE $RPC_PORT $PEERPORT $PEERPORT/UDP

CMD /usr/bin/transmission-daemon \
                        --foreground \
                        --config-dir /data/.config \
                        --port $RPC_PORT \
                        --peerport $PEERPORT \
                        --username $USERNAME \
                        --password ${PASSWORD:-$(hostname)}
