FROM alpine:3.11

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="ruTorrent" \
        org.label-schema.version=$VERSION

ENV RUTORRENT_VER=3.9 \
    UID=1000 \
    GID=1000 \
    USERNAME=admin \
    PASSWORD=

# Let's roll
RUN set -xe && \
    apk add --no-cache \
        --virtual .run-deps \
        apache2-utils \
        ca-certificates \
        libtorrent \
        nginx \
        php7 \
        php7-fpm \
        php7-json \
        rtorrent \
        xmlrpc-c \
        supervisor && \
    apk add --no-cache \
        --virtual .plug-deps \
        curl \
        ffmpeg \
        mediainfo \
        mktorrent \
        sox \
        unrar \
        unzip \
        zip && \
    apk add --no-cache tar && \
    mkdir /tmp/rutorrent && cd /tmp/rutorrent && \
    curl -sSL https://github.com/Novik/ruTorrent/archive/v$RUTORRENT_VER.tar.gz | tar xz --strip 1 && \
    cd / && mv /tmp/rutorrent /var/www/rutorrent && \
    apk del tar && \
    rm -rf /var/www/rutorrent/.git*

COPY rootfs /

VOLUME /data

EXPOSE 8080 55000

CMD ["/usr/bin/entrypoint.sh"]
