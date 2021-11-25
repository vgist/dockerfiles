FROM alpine:3.15

ARG VERSION

RUN set -xe && \
    apk add --no-cache rsync

COPY rsyncd.conf /etc/

VOLUME /mnt

CMD rsync --daemon --no-detach --log-file /dev/stdout
