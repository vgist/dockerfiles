FROM alpine:3.12

ARG VERSION

ENV PASSWORD=

RUN set -xe && \
    apk add --no-cache \
        samba-server \
        samba-common-tools

COPY rootfs /

VOLUME /mnt
EXPOSE 137/udp 138/udp 139/tcp 445/tcp

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD nmbd --daemon && \
    smbd --foreground \
         --log-stdout \
         --no-process-group \
         --configfile /etc/samba/smb.conf
