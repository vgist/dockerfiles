FROM alpine:3.7
MAINTAINER nil

ENV UID     100
ENV GID     101

RUN set -ex && \
    apk add --no-cache lighttpd

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY index.html /var/www/index.html

WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 80

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
