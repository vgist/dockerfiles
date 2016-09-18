FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV UID     100
ENV GID     101

RUN set -ex && \
    apk add --no-cache lighttpd && \

    rm -rf /var/www/localhost && \
    mkdir -p /var/lib/lighttpd/cache/compress && \
    chown lighttpd:lighttpd -R /var/lib/lighttpd/cache/compress

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY index.html /var/www/index.html

WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 80

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
