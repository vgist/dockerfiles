FROM alpine:3.11

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="Samba" \
        org.label-schema.version=$VERSION

ENV UID=1000 \
    GID=1000 \
    USERNAME=samba \
    PASSWORD=

RUN set -xe && \
    apk add --no-cache samba-server samba-common-tools supervisor

COPY rootfs /

VOLUME /mnt
EXPOSE 137/udp 138/udp 139/tcp 445/tcp

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
