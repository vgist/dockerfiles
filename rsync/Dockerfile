FROM alpine:3.9

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="rsync" \
        org.label-schema.version=$VERSION

RUN set -xe && \
    apk add --no-cache rsync

COPY rsyncd.conf /etc/

VOLUME /mnt

CMD rsync --daemon --no-detach --log-file /dev/stdout
