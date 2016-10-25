FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ARG MKTORRENT_VER=1.0
ARG MKTORRENT_URL=https://github.com/Rudde/mktorrent/archive/v${MKTORRENT_VER}.tar.gz

ENV USERNAME        admin
ENV PASSWORD=
ENV UID             1000
ENV GID             1000

# Let's roll
RUN set -xe && \
    apk add --no-cache --virtual .run-deps \
                                apache2-utils \
                                ca-certificates \
                                nginx \
                                php5-fpm \
                                php5-json \
                                xmlrpc-c \
                                rtorrent \
                                libtorrent \
                                curl \
                                gzip \
                                zip \
                                unrar \
                                supervisor && \
    apk add --no-cache --virtual .build-deps \
                                build-base \
                                tar \
                                git && \

    cd /tmp && \
    curl -sSL $MKTORRENT_URL | tar xz --strip 1 && \
    make && make install && \

    git clone https://github.com/Novik/ruTorrent.git /var/www/rutorrent && \

    apk del .build-deps && \
    rm -rf /var/www/rutorrent/.git && \
    rm -rf /tmp/*

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY supervisord.ini /etc/supervisor.d/supervisord.ini
COPY rtorrent.rc /etc/rtorrent.rc
COPY rutorrent /var/www/rutorrent
COPY etc /etc

VOLUME /download
VOLUME /var/www/rutorrent/share/users

EXPOSE 8080 55000

CMD ["/usr/bin/entrypoint.sh"]
