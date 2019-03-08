FROM alpine:3.9

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="RTorrent" \
        org.label-schema.version=$VERSION

ENV USERNAME        admin
ENV PASSWORD=
ENV UID             1000
ENV GID             1000

# Let's roll
RUN set -xe && \
    apk add --no-cache --virtual .run-deps \
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
    apk add --no-cache --virtual .plug-deps \
        curl \
        ffmpeg \
        mediainfo \
        mktorrent \
        sox \
        unrar \
        unzip \
        zip && \
    apk add --no-cache git && \
    git clone https://github.com/Novik/ruTorrent.git /var/www/rutorrent && \
    apk del git && \
    rm -rf /var/www/rutorrent/.git*

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY supervisord.ini /etc/supervisor.d/supervisord.ini
COPY rtorrent.rc /etc/rtorrent.rc
COPY rutorrent /var/www/rutorrent
COPY etc /etc

VOLUME /download

EXPOSE 8080 55000

CMD ["/usr/bin/entrypoint.sh"]
