FROM alpine:3.5
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV UID     100
ENV GID     101

# Let's roll
RUN set -xe && \
    apk add --no-cache nginx \
                        nginx-mod-devel-kit \
                        nginx-mod-http-echo \
                        nginx-mod-http-fancyindex \
                        nginx-mod-http-geoip \
                        nginx-mod-http-headers-more \
                        nginx-mod-http-image-filter \
                        nginx-mod-http-lua \
                        nginx-mod-http-nchan \
                        nginx-mod-http-perl \
                        nginx-mod-http-upload-progress \
                        nginx-mod-http-xslt-filter \
                        nginx-mod-mail \
                        nginx-mod-rtmp \
                        nginx-mod-stream && \
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

CMD ["nginx", "-g", "daemon off;"]
