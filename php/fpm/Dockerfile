FROM alpine:3.7

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="PHP" \
        org.label-schema.version=$VERSION

# Environments
ENV MEMORY_LIMIT            256M
ENV MAX_EXECUTION_TIME      60
ENV UPLOAD_MAX_FILESIZE     64M
ENV MAX_FILE_UPLOADS        20
ENV POST_MAX_SIZE           64M
ENV MAX_INPUT_VARS          4000
ENV DATE_TIMEZONE           Asia/Shanghai
ENV PM_MAX_CHILDREN         6
ENV PM_START_SERVERS        4
ENV PM_MIN_SPARE_SERVERS    2
ENV PM_MAX_SPARE_SERVERS    6
ENV UID                     100
ENV GID                     101

# Let's roll
RUN set -xe && \
    apk add --no-cache \
    php5-mcrypt \
    php5-soap \
    php5-openssl \
    php5-gmp \
    php5-pdo_odbc \
    php5-json \
    php5-dom \
    php5-pdo \
    php5-zip \
    php5-zlib \
    php5-mysql \
    php5-mysqli \
    php5-sqlite3 \
    php5-apcu \
    php5-pdo_pgsql \
    php5-bcmath \
    php5-gd \
    php5-odbc \
    php5-pdo_mysql \
    php5-pdo_sqlite \
    php5-gettext \
    php5-xmlreader \
    php5-xmlrpc \
    php5-bz2 \
    php5-mssql \
    php5-iconv \
    php5-pdo_dblib \
    php5-opcache \
    php5-curl \
    php5-ctype \
    php5-fpm

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/bin/php-fpm5"]
