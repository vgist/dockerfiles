FROM alpine:3.12

ARG VERSION

ENV UID=1000 \
    GID=1000 \
    RPC_PORT=9091 \
    PEER_PORT=51413 \
    USERNAME=username \
    PASSWORD=

# Let's roll
RUN set -xe && \
    apk add --no-cache curl libcap su-exec shadow tar transmission-daemon && \
    setcap 'cap_net_bind_service=+ep' /usr/bin/transmission-daemon && \
    cd /tmp && \
    curl -sSL https://github.com/ronggang/transmission-web-control/archive/v1.6.0-beta2.tar.gz | \
    tar xz --strip 1 && \
    cp /usr/share/transmission/web/index.html /usr/share/transmission/web/index.original.html && \
    cp -rf /tmp/src/* /usr/share/transmission/web/ && \
    apk del curl libcap tar && \
    rm -rf /tmp/*

COPY rootfs /

VOLUME /data

EXPOSE $RPC_PORT $PEER_PORT $PEER_PORT/UDP

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD /usr/bin/transmission-daemon \
        --foreground \
        --config-dir /data/.config \
        --port $RPC_PORT \
        --peerport $PEER_PORT \
        --username $USERNAME \
        --password ${PASSWORD:-$(hostname)}
