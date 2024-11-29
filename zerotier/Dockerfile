FROM alpine:3 as stage

ARG VERSION

RUN set -ex && \
    apk add --no-cache \
        autoconf \
        build-base \
        cargo \
        curl \
        linux-headers \
        openssl-dev \
        tar && \
    cd /tmp && \
    curl -sSL https://github.com/zerotier/ZeroTierOne/archive/refs/tags/$VERSION.tar.gz | tar xz --strip 1 && \
    make -j `nproc` && make selftest

FROM alpine:3

ARG VERSION
ENV PEER_PORT=9993

COPY --from=stage /tmp/zerotier-one /usr/sbin

RUN set -ex && \
    ln -sf /usr/sbin/zerotier-one /usr/sbin/zerotier-idtool && \
    ln -sf /usr/sbin/zerotier-one /usr/sbin/zerotier-cli && \
    runDeps="$( \
        scanelf --needed --nobanner /usr/sbin/zerotier-one \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps libgcc libstdc++

VOLUME ["/var/lib/zerotier-one"]

EXPOSE $PEER_PORT/udp

CMD ["/usr/sbin/zerotier-one"]
