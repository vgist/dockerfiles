FROM alpine:edge
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV UID     1000
ENV GID     1000

RUN set -xe && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache \
                    firefox \
                    libcanberra-gtk3 \
                    dbus-x11 \
                    libstdc++ \
                    libgcc \
                    musl \
                    ttf-dejavu \
                    su-exec

COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/bin/firefox", "-new-instance"]
