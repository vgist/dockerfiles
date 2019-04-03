FROM alpine:3.9

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="Transmission" \
        org.label-schema.version=$VERSION

ENV UID         1000
ENV GID         1000
ENV RPC_PORT    9091
ENV PEER_PORT   51413
ENV USERNAME    username
ENV PASSWORD=

# Let's roll
RUN set -xe && \
    apk add --no-cache curl su-exec shadow tar transmission-daemon && \
    cd /tmp && \
    curl -sSL https://github.com/ronggang/transmission-web-control/archive/v1.6.0-beta2.tar.gz | tar xz --strip 1 && \
    cp /usr/share/transmission/web/index.html /usr/share/transmission/web/index.original.html && \
    cp -rf /tmp/src/* /usr/share/transmission/web/ && \
    apk del tar curl && \
    rm -rf /tmp/*

COPY settings.json /etc/transmission/settings.json

COPY entrypoint.sh /usr/bin/entrypoint.sh

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
