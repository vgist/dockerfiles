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
        php85 \
        php85-bcmath \
        php85-bz2 \
        php85-ctype \
        php85-curl \
        php85-dom \
        php85-embed \
        php85-exif \
        php85-fileinfo \
        php85-fpm \
        php85-gd \
        php85-gettext \
        php85-gmp \
        php85-iconv \
        php85-intl \
        php85-mbstring \
        php85-mysqli \
        php85-mysqlnd \
        php85-odbc \
        php85-openssl \
        php85-pdo \
        php85-pdo_dblib \
        php85-pdo_mysql \
        php85-pdo_odbc \
        php85-pdo_pgsql \
        php85-pdo_sqlite \
        php85-posix \
        php85-pecl-imagick \
        php85-session \
        php85-simplexml \
        php85-soap \
        php85-sodium \
        php85-sqlite3 \
        php85-tokenizer \
        php85-xml \
        php85-xmlreader \
        php85-zip

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/sbin/php-fpm85"]
