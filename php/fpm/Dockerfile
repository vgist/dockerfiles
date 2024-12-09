FROM alpine:3

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
        php83-bcmath \
        php83-bz2 \
        php83-curl \
        php83-ctype \
        php83-embed \
        php83-dom \
        php83-exif \
        php83-fileinfo \
        php83-gd \
        php83-gettext \
        php83-gmp \
        php83-iconv \
        php83-intl \
        php83-mbstring \
        php83-mysqli \
        php83-mysqlnd \
        php83-odbc \
        php83-opcache \
        php83-openssl \
        php83-pecl-imagick \
        php83-pdo \
        php83-pdo_dblib \
        php83-pdo_mysql \
        php83-pdo_odbc \
        php83-pdo_pgsql \
        php83-pdo_sqlite \
        php83-session \
        php83-simplexml \
        php83-soap \
        php83-sodium \
        php83-sqlite3 \
        php83-tokenizer \
        php83-xmlreader \
        php83-zip \
        php83-fpm \
        php83

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/sbin/php-fpm83"]
