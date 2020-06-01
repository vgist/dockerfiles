FROM alpine:3.12

ARG VERSION

ENV UID=100 \
    GID=101

RUN set -ex && \
    apk add --no-cache lighttpd

COPY rootfs /

WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 80

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
