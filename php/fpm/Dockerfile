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
        php84 \
        php84-bcmath \
        php84-bz2 \
        php84-ctype \
        php84-curl \
        php84-dom \
        php84-embed \
        php84-exif \
        php84-fileinfo \
        php84-fpm \
        php84-gd \
        php84-gettext \
        php84-gmp \
        php84-iconv \
        php84-intl \
        php84-mbstring \
        php84-mysqli \
        php84-mysqlnd \
        php84-odbc \
        php84-opcache \
        php84-openssl \
        php84-pdo \
        php84-pdo_dblib \
        php84-pdo_mysql \
        php84-pdo_odbc \
        php84-pdo_pgsql \
        php84-pdo_sqlite \
        php84-pecl-imagick \
        php84-session \
        php84-simplexml \
        php84-soap \
        php84-sodium \
        php84-sqlite3 \
        php84-tokenizer \
        php84-xml \
        php84-xmlreader \
        php84-zip

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/sbin/php-fpm84"]
