FROM alpine:3.5
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV RPC_PORT    9091
ENV PEERPORT    51413
ENV USERNAME    username
ENV PASSWORD=

# Let's roll
RUN set -xe && \
    apk add --no-cache transmission-daemon tar curl && \

    cd /tmp && \
    curl -sSL https://raw.githubusercontent.com/ronggang/transmission-web-control/master/release/transmission-control-full.tar.gz | tar xz && \

    cp /usr/share/transmission/web/index.html /usr/share/transmission/web/index.original.html && \
    cp -r /tmp/web /usr/share/transmission/ && \

    apk del tar curl && \
    rm -rf /tmp/*

COPY settings.json /etc/transmission/settings.json

COPY entrypoint.sh /usr/bin/entrypoint.sh

VOLUME /data

EXPOSE $RPC_PORT $PEERPORT $PEERPORT/UDP

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD /usr/bin/transmission-daemon \
                        --foreground \
                        --config-dir /data/.config \
                        --port $RPC_PORT \
                        --peerport $PEERPORT \
                        --username $USERNAME \
                        --password ${PASSWORD:-$(hostname)}
