FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

# Environments
ENV TIMEZONE            Asia/Shanghai
ENV PHP_MEMORY_LIMIT    128M
ENV MAX_UPLOAD          20M
ENV PHP_MAX_FILE_UPLOAD 20
ENV PHP_MAX_POST        30M

# Let's roll
RUN set -xe && \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
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
    php5-fpm && \

    # Set environments
    sed -i "s|;*daemonize\s*=\s*yes|daemonize = no|g" /etc/php5/php-fpm.conf && \
    sed -i "s|;*error_log\s*=\s*log/php/error.log|error_log = /dev/stderr|g" /etc/php5/php-fpm.conf && \
    sed -i "s|;*listen\s*=\s*127.0.0.1:9000|listen = 9000|g" /etc/php5/php-fpm.conf && \
    sed -i "s|;*chdir\s*=\s*/var/www|chdir = /var/www|g" /etc/php5/php-fpm.conf && \
    sed -i "s|pm.max_children =.*|pm.max_children = 12|i" /etc/php5/php-fpm.d/www.conf && \
    sed -i "s|pm.start_servers =.*|pm.start_servers = 6|i" /etc/php5/php-fpm.d/www.conf && \
    sed -i "s|pm.min_spare_servers =.*|pm.min_spare_servers = 2|i" /etc/php5/php-fpm.d/www.conf && \
    sed -i "s|pm.max_spare_servers =.*|pm.max_spare_servers = 10|i" /etc/php5/php-fpm.d/www.conf && \
    sed -i "s|;*date.timezone =.*|date.timezone = ${TIMEZONE}|i" /etc/php5/php.ini && \
    sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" /etc/php5/php.ini && \
    sed -i "s|;*upload_max_filesize =.*|upload_max_filesize = ${MAX_UPLOAD}|i" /etc/php5/php.ini && \
    sed -i "s|;*max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|i" /etc/php5/php.ini && \
    sed -i "s|;*post_max_size =.*|post_max_size = ${PHP_MAX_POST}|i" /etc/php5/php.ini && \
    sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= 0|i" /etc/php5/php.ini && \

    # Cleaning up
    mkdir -p /var/www && \
    chown -Rf nobody:nobody /var/www && \
    apk del --purge tzdata && \
    rm -rf /var/cache/apk/*

# Set Workdir
WORKDIR /var/www

# Expose volumes
VOLUME ["/var/www"]

# Entry point
ENTRYPOINT ["/usr/bin/php-fpm"]
