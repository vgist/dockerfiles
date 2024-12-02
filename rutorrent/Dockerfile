FROM alpine:3

ARG VERSION

ENV UID=1000 \
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
        php83 \
        php83-dom \
        php83-fpm \
        php83-json \
        php83-session \
        rtorrent \
        shadow \
        xmlrpc-c \
        runit && \
    apk add --no-cache \
        --virtual .plug-deps \
        curl \
        ffmpeg \
        mediainfo \
        mktorrent \
        sox \
        unzip \
        zip && \
    apk add --no-cache tar && \
    mkdir /tmp/rutorrent && cd /tmp/rutorrent && \
    curl -sSL https://github.com/Novik/ruTorrent/archive/v${VERSION}.tar.gz | tar xz --strip 1 && \
    sed -i "s|'USE_UNRAR', true|'USE_UNRAR', false|g" /tmp/rutorrent/plugins/unpack/conf.php && \
    cd / && mv /tmp/rutorrent /var/www/rutorrent && \
    apk del tar && \
    rm -rf /var/www/rutorrent/.git*

COPY rootfs /

VOLUME /data

EXPOSE 8080 55000

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/sbin/runsvdir", "-P", "/etc/service"]
