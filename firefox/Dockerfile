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
                    ttf-dejavu && \
    addgroup -g ${GID} -S firefox && \
    adduser -u ${UID} -G firefox -h /home/firefox -D firefox

USER firefox

CMD ["/usr/bin/firefox", "-new-instance"]
