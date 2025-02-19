FROM alpine:3

ARG VERSION

ENV UID=100 GID=101

# Let's roll
RUN set -xe && \
    apk add --no-cache \
        shadow \
        nginx \
        nginx-mod-devel-kit \
        nginx-mod-http-brotli \
        nginx-mod-http-dav-ext \
        nginx-mod-http-cache-purge \
        nginx-mod-http-echo \
        nginx-mod-http-fancyindex \
        nginx-mod-http-geoip \
        nginx-mod-http-geoip2 \
        nginx-mod-http-headers-more \
        nginx-mod-http-image-filter \
        nginx-mod-http-perl \
        nginx-mod-http-redis2 \
        nginx-mod-http-set-misc \
        nginx-mod-http-upload-progress \
        nginx-mod-http-xslt-filter \
        nginx-mod-mail \
        nginx-mod-rtmp \
        nginx-mod-stream \
        nginx-mod-stream-geoip \
        nginx-mod-stream-geoip2 && \
    mkdir -p /run/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

VOLUME ["/var/www"]
VOLUME ["/etc/nginx/conf.d"]

EXPOSE 80 443

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
