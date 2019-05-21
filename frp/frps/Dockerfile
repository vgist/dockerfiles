FROM alpine:3.9

ARG VERSION=0.27.0
ARG REPO=github.com/fatedier/frp
ARG URL=https://$REPO/archive/v$VERSION.tar.gz

LABEL maintainer="zgist" \
        org.label-schema.name="frps" \
        org.label-schema.version=$VERSION

# Let's roll
RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
                                curl \
                                git \
                                build-base \
                                go \
                                upx && \
    mkdir -p /tmp/frp && cd /tmp/frp && \
    curl -sSL $URL | tar xz --strip 1 && \
    go mod download && \
    go build -v -o /usr/bin/frps ./cmd/frps && \
    cp ./conf/frps.ini /etc/ && \
    cd / && upx --best /usr/bin/frps && \
    rm -rf /root/go /root/.cache /root/.ash_history /tmp/frp && \
    apk del .build-deps

CMD ["/usr/bin/frps", "-c", "/etc/frps.ini"]
