FROM alpine:3.16

ARG VERSION

# Environments
ENV MEMORY_LIMIT=256M \
    MAX_EXECUTION_TIME=60 \
    UPLOAD_MAX_FILESIZE=64M \
    MAX_FILE_UPLOADS=20 \
    POST_MAX_SIZE=64M \
    MAX_INPUT_VARS=4000 \
    DATE_TIMEZONE=Asia/Shanghai \
    PM_MAX_CHILDREN=6 \
    PM_START_SERVERS=4 \
    PM_MIN_SPARE_SERVERS=2 \
    PM_MAX_SPARE_SERVERS=6 \
    UID=101 \
    GID=101

# Let's roll
RUN set -xe && \
    apk add --no-cache \
        composer \
        php8-bcmath \
        php8-bz2 \
        php8-curl \
        php8-ctype \
        php8-embed \
        php8-dom \
        php8-exif \
        php8-fileinfo \
        php8-gd \
        php8-gettext \
        php8-gmp \
        php8-iconv \
        php8-json \
        php8-mbstring \
        php8-mysqli \
        php8-mysqlnd \
        php8-odbc \
        php8-opcache \
        php8-openssl \
        php8-pecl-imagick \
        php8-pdo \
        php8-pdo_dblib \
        php8-pdo_mysql \
        php8-pdo_odbc \
        php8-pdo_pgsql \
        php8-pdo_sqlite \
        php8-session \
        php8-simplexml \
        php8-soap \
        php8-sodium \
        php8-sqlite3 \
        php8-tokenizer \
        php8-xmlreader \
        php8-zip \
        php8-fpm \
        php8

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/sbin/php-fpm8"]
