FROM alpine:3.9

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="Samba" \
        org.label-schema.version=$VERSION

ENV UID         1000
ENV GID         1000
ENV USERNAME    samba
ENV PASSWORD=

RUN set -xe && \
    apk add --no-cache samba-server samba-common-tools supervisor

COPY smb.conf /etc/samba/smb.conf
COPY supervisord.ini /etc/supervisor.d/supervisord.ini
COPY entrypoint.sh /usr/bin/entrypoint.sh

VOLUME /mnt
EXPOSE 137/udp 138/udp 139/tcp 445/tcp

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
