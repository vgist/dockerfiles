FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ARG MKTORRENT_VER=1.0
ARG MEDIAINFO_VER=0.7.88

ENV USERNAME        admin
ENV PASSWORD=password
ENV UID             1000
ENV GID             1000

# Let's roll
RUN set -xe && \
    apk add --no-cache --virtual .run-deps \
                                    apache2-utils \
                                    imagemagick \
                                    ffmpeg \
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
                                    supervisor \
                                    geoip && \
    apk add --no-cache --virtual .build-deps \
                                    build-base \
                                    git \
                                    libtool \
                                    automake \
                                    autoconf \
                                    cppunit-dev \
                                    openssl-dev \
                                    ncurses-dev \
                                    curl-dev && \

    cd /tmp && \
    curl -sSL https://github.com/Rudde/mktorrent/archive/v${MKTORRENT_VER}.tar.gz | tar xz && \
    wget http://mediaarea.net/download/binary/libmediainfo0/${MEDIAINFO_VER}/MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz && \
    tar xzf MediaInfo_DLL_${MEDIAINFO_VER}_GNU_FromSource.tar.gz && \
    wget http://mediaarea.net/download/binary/mediainfo/${MEDIAINFO_VER}/MediaInfo_CLI_${MEDIAINFO_VER}_GNU_FromSource.tar.gz && \
    tar xzf MediaInfo_CLI_${MEDIAINFO_VER}_GNU_FromSource.tar.gz && \

    cd /tmp/mktorrent-${MKTORRENT_VER} && \
    make && make install && \

    cd /tmp/MediaInfo_DLL_GNU_FromSource && \
    ./SO_Compile.sh && \
    cd /tmp/MediaInfo_DLL_GNU_FromSource/ZenLib/Project/GNU/Library && \
    make install && \
    cd /tmp/MediaInfo_DLL_GNU_FromSource/MediaInfoLib/Project/GNU/Library && \
    make install && \

    cd /tmp/MediaInfo_CLI_GNU_FromSource && \
    ./CLI_Compile.sh && \
    cd /tmp/MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI && \
    make install && \

    git clone https://github.com/Novik/ruTorrent.git /var/www/rutorrent && \
    git clone https://github.com/xombiemp/rutorrentMobile.git /var/www/rutorrent/plugins/mobile && \
    git clone https://github.com/Phlooo/ruTorrent-MaterialDesign.git /var/www/rutorrent/plugins/theme/themes/materialdesign && \

    apk del .build-deps && \
    cd / && \
    rm -rf /var/cache/apk/* /tmp/*

COPY conf /

VOLUME /download
VOLUME /var/www/rutorrent/share/users

EXPOSE 8080 55000

CMD ["/usr/bin/startup"]