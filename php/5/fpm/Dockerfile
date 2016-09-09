FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

# Environments
ENV PHP_MEMORY_LIMIT    256M
ENV MAX_UPLOAD          64M
ENV PHP_MAX_FILE_UPLOAD 20
ENV PHP_MAX_POST        64M
ENV MAX_INPUT_VARS      4000

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
    php5-mysql \
    php5-mysqli \
    php5-sqlite3 \
    php5-apcu \
    php5-pdo_pgsql \
    php5-bcmath \
    php5-gd \
    php5-xcache \
    php5-odbc \
    php5-pdo_mysql \
    php5-pdo_sqlite \
    php5-gettext \
    php5-xmlreader \
    php5-xmlrpc \
    php5-bz2 \
    php5-memcache \
    php5-xcache \
    php5-mssql \
    php5-iconv \
    php5-pdo_dblib \
    php5-curl \
    php5-ctype \
    php5-fpm

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/www

VOLUME ["/var/www"]

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/bin/php-fpm"]
