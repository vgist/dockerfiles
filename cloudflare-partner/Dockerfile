FROM alpine:3.16

ARG VERSION

ENV HOST_KEY=e9e4498f0584b7098692512db0c62b48 \
    HOST_MAIL=ze3kr@example.com               \
    TITLE=TlOxygen

RUN set -ex && \
    apk add --no-cache --virtual runtimes \
        curl            \
        nginx           \
        php8            \
        php8-fpm        \
        php8-cli        \
        php8-json       \
        php8-gettext    \
        php8-curl       \
        php8-apcu       \
        php8-phar       \
        php8-iconv      \
        php8-mbstring   \
        php8-openssl && \
    mkdir -p /app && cd /app                                                && \
    curl -sSL https://github.com/vgist/Cloudflare-CNAME-Setup/archive/$VERSION.tar.gz | \
    tar xz --strip 1 && rm -f /etc/nginx/http.d/default.conf                && \
    mkdir -p /run/nginx && ln -s /var/run/nginx.pid /run/nginx/nginx.pid    && \
    cp /app/.docker/nginx.conf /etc/nginx/http.d/cloudflare.conf            && \
    cp /app/.docker/php-fpm.conf /etc/php8/php-fpm.conf                     && \
    curl -s https://getcomposer.org/installer | php                         && \
    php composer.phar install --no-dev -o

WORKDIR /app
EXPOSE 80

CMD cp /app/config.example.php /app/config.php && nginx                                     && \
    sed -i "s|e9e4498f0584b7098692512db0c62b48|${HOST_KEY}|g" /app/config.php               && \
    sed -i "s|ze3kr@example.com|${HOST_MAIL}|g"               /app/config.php               && \
    sed -i "s|// \$page_title = \"TlOxygen\"|\$page_title = \"${TITLE}\"|g" /app/config.php && \
    sed -i "s|// \$tlo_path = \"/\"|\$tlo_path = \"/\"|g" /app/config.php                   && \
    php-fpm8 --nodaemonize --fpm-config /etc/php8/php-fpm.conf -c /etc/php8/php.ini

