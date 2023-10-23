FROM alpine:3.18

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
        php82-bcmath \
        php82-bz2 \
        php82-curl \
        php82-ctype \
        php82-embed \
        php82-dom \
        php82-exif \
        php82-fileinfo \
        php82-gd \
        php82-gettext \
        php82-gmp \
        php82-iconv \
        php82-json \
        php82-mbstring \
        php82-mysqli \
        php82-mysqlnd \
        php82-odbc \
        php82-opcache \
        php82-openssl \
        php82-pecl-imagick \
        php82-pdo \
        php82-pdo_dblib \
        php82-pdo_mysql \
        php82-pdo_odbc \
        php82-pdo_pgsql \
        php82-pdo_sqlite \
        php82-session \
        php82-simplexml \
        php82-soap \
        php82-sodium \
        php82-sqlite3 \
        php82-tokenizer \
        php82-xmlreader \
        php82-zip \
        php82-fpm \
        php82

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/sbin/php-fpm82"]
