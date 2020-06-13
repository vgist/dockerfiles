FROM alpine:3.12

ARG VERSION

RUN apk add --no-cache --virtual .build-deps \
        boost-dev \
        build-base \
        cmake \
        curl \
        libcap \
        mariadb-connector-c-dev \
        openssl-dev \
        tar && \
    mkdir /tmp/trojan /etc/trojan && cd /tmp/trojan && \
    curl -sSL https://github.com/trojan-gfw/trojan/archive/v$VERSION.tar.gz \
    | tar xz --strip 1 && \
    cmake -DDEFAULT_CONFIG=/etc/trojan/config.json . && \
    make -j $(nproc) && strip -s trojan && \
    setcap 'cap_net_bind_service=+ep' ./trojan && \
    mv trojan /usr/bin/ && \
    mv examples/server.json-example /etc/trojan/config.json && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/trojan \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    cd / && rm -rf /tmp/trojan && \
    apk del .build-deps

CMD ["trojan", "-c" "/etc/trojan/config.json"]
