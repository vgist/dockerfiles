FROM alpine:3.9

ARG VERSION=1.1.0
ARG REPO=github.com/shadowsocks/v2ray-plugin
ARG URL=https://$REPO/archive/v$VERSION.tar.gz

LABEL maintainer="zgist" \
        org.label-schema.name="v2ray-plugin" \
        org.label-schema.version=$VERSION

ENV ARGS=

# Let's roll
RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
                                curl \
                                git \
                                build-base \
                                go \
                                upx && \
    mkdir -p /tmp/plugin && cd /tmp/plugin && \
    curl -sSL $URL | tar xz --strip 1 && \
    go mod download && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
        go build -v -ldflags "-X main.VERSION=$VERSION -s -w" -gcflags "" -o /usr/bin/v2ray-plugin && \
    cd / && upx --best /usr/bin/v2ray-plugin && \
    rm -rf /root/go /root/.cache /root/.ash_history /tmp/plugin && \
    apk del .build-deps

CMD v2ray-plugin $ARGS
