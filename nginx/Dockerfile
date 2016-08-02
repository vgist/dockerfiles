FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

# Let's roll
RUN set -xe && \
    apk add -U --no-cache nginx && \
    mkdir -p /run/nginx && \
    mkdir -p /usr/share/nginx/html/ && \
    touch /usr/share/nginx/html/index.html && \
    touch /usr/share/nginx/html/50x.html && \
    echo "welcome" >> /usr/share/nginx/html/index.html && \
    echo "error" >> /usr/share/nginx/html/50x.html && \
    rm -rf /var/www/localhost && \
    chown -Rf nobody:nobody /var/www && \
    chmod -Rf 755 /var/lib/nginx && \
    rm -rf /var/cache/apk/* && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY index.html /var/www/index.html
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

VOLUME ["/var/www"]
VOLUME ["/etc/nginx/conf.d"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
