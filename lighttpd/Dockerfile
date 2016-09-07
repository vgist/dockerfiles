FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

RUN set -ex && \
    apk add --no-cache lighttpd && \

    rm -rf /var/www/localhost && \
    chown nobody:nobody -R /var/www && \
    mkdir -p /var/lib/lighttpd/cache/compress && \
    chown nobody:nobody -R /var/lib/lighttpd/cache/compress

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY index.html /var/www/index.html

WORKDIR /var/www

EXPOSE 80

VOLUME /var/www

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
