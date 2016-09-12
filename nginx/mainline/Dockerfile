FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ARG NGINX_VERSION=1.11.3
ARG NJS_SHAID=1c50334fbea6
ARG DEV_KIT_VERSION=0.3.0
ARG LUA_MODULE_VERSION=0.10.6
ARG RTMP_VERSION=1.1.9
ARG UPLOAD_PROGRESS_VERSION=0.9.2
ARG ECHO_VERSION=0.60
ARG FANCYINDEX_VERSION=0.4.1
ARG HEADERS_MORE_VERSION=0.31
ARG GPG_KEYS=B0F4253373F8F6F510D42178520A9993A1C052F8

# Let's roll
RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
                                build-base \
                                linux-headers \
                                openssl-dev \
                                pcre-dev \
                                curl \
                                tar \
                                gnupg \
                                libxslt-dev \
                                libxml2-dev \
                                gd-dev \
                                geoip-dev \
                                lua-dev \
                                perl-dev \
                                zlib-dev && \

    mkdir -p /tmp/nginx && \
    cd /tmp/nginx && \
    curl -sSL http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz -o nginx.tar.gz && \
    curl -sSL http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz.asc  -o nginx.tar.gz.asc && \
    export GNUPGHOME="$(mktemp -d)" && \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GPG_KEYS" && \
    gpg --batch --verify nginx.tar.gz.asc nginx.tar.gz && \
    tar xzf nginx.tar.gz --strip 1 && \
    curl -sSL http://hg.nginx.org/njs/archive/${NJS_SHAID}.tar.gz | tar xz && \
    curl -sSL https://github.com/simpl/ngx_devel_kit/archive/v${DEV_KIT_VERSION}.tar.gz | tar xz && \
    curl -sSL https://github.com/openresty/lua-nginx-module/archive/v${LUA_MODULE_VERSION}.tar.gz | tar xz && \
    curl -sSL https://github.com/arut/nginx-rtmp-module/archive/v${RTMP_VERSION}.tar.gz | tar xz && \
    curl -sSL https://github.com/masterzen/nginx-upload-progress-module/archive/v${UPLOAD_PROGRESS_VERSION}.tar.gz | tar xz && \
    curl -sSL https://github.com/openresty/echo-nginx-module/archive/v${ECHO_VERSION}.tar.gz | tar xz && \
    curl -sSL https://github.com/aperezdc/ngx-fancyindex/archive/v${FANCYINDEX_VERSION}.tar.gz | tar xz && \
    curl -sSL https://github.com/openresty/headers-more-nginx-module/archive/v${HEADERS_MORE_VERSION}.tar.gz | tar xz && \

    ./configure \
    --prefix=/usr/share/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --sbin-path=/usr/sbin/nginx \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/run/nginx/nginx.lock \
    --http-client-body-temp-path=/var/lib/nginx/tmp/client_body \
    --http-proxy-temp-path=/var/lib/nginx/tmp/proxy \
    --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi \
    --http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi \
    --http-scgi-temp-path=/var/lib/nginx/tmp/scgi \
    \
    --user=nobody \
    --group=nobody \
    --with-file-aio \
    --with-threads \
    --with-ipv6 \
    \
    --with-http_ssl_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_stub_status_module \
    --with-http_auth_request_module \
    --with-http_v2_module \
    --with-http_slice_module \
    --with-http_geoip_module=dynamic \
    --with-http_image_filter_module=dynamic \
    --with-http_xslt_module=dynamic \
    --with-http_perl_module=dynamic \
    --with-mail=dynamic \
    --with-mail_ssl_module \
    --with-stream=dynamic \
    --with-stream_ssl_module \
    \
    --add-dynamic-module=njs-${NJS_SHAID}/nginx \
    --add-dynamic-module=ngx_devel_kit-${DEV_KIT_VERSION} \
    --add-dynamic-module=lua-nginx-module-${LUA_MODULE_VERSION} \
    --add-dynamic-module=nginx-rtmp-module-${RTMP_VERSION} \
    --add-dynamic-module=nginx-upload-progress-module-${UPLOAD_PROGRESS_VERSION} \
    --add-dynamic-module=echo-nginx-module-${ECHO_VERSION} \
    --add-dynamic-module=ngx-fancyindex-${FANCYINDEX_VERSION} \ 
    --add-dynamic-module=headers-more-nginx-module-${HEADERS_MORE_VERSION} && \
    make -j $(getconf _NPROCESSORS_ONLN) && \
    make install && \

    mkdir -p /etc/nginx/conf.d && \
    mkdir -p /etc/nginx/modules && \
    mkdir -p /var/lib/nginx/tmp && \
    chown -R nobody /var/lib/nginx/tmp && \
    mkdir -p /var/www && \
    chown -Rf nobody /var/www && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \

    apk add --no-cache --virtual .gettext gettext && \
    mv /usr/bin/envsubst /tmp/ && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/sbin/nginx /usr/share/nginx/modules/*.so /tmp/envsubst \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | sort -u \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    apk del .gettext && \
    mv /tmp/envsubst /usr/bin/ && \
    cd .. && \
    rm -rf /tmp/nginx && \
    rm -r "$GNUPGHOME" 

COPY index.html /var/www/index.html
COPY nginx.conf /etc/nginx/nginx.conf
COPY modules.conf /etc/nginx/modules/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

VOLUME ["/var/www"]
VOLUME ["/etc/nginx/conf.d"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
