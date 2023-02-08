FROM alpine:3.17

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
        php81-bcmath \
        php81-bz2 \
        php81-curl \
        php81-ctype \
        php81-embed \
        php81-dom \
        php81-exif \
        php81-fileinfo \
        php81-gd \
        php81-gettext \
        php81-gmp \
        php81-iconv \
        php81-json \
        php81-mbstring \
        php81-mysqli \
        php81-mysqlnd \
        php81-odbc \
        php81-opcache \
        php81-openssl \
        php81-pecl-imagick \
        php81-pdo \
        php81-pdo_dblib \
        php81-pdo_mysql \
        php81-pdo_odbc \
        php81-pdo_pgsql \
        php81-pdo_sqlite \
        php81-session \
        php81-simplexml \
        php81-soap \
        php81-sodium \
        php81-sqlite3 \
        php81-tokenizer \
        php81-xmlreader \
        php81-zip \
        php81-fpm \
        php81

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/sbin/php-fpm81"]
