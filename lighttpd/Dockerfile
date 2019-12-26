FROM alpine:3.11

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="Lighttpd" \
        org.label-schema.version=$VERSION

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
