FROM alpine:3.11

ARG VERSION=1.2.0
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
    CGO_ENABLED=0 GOOS=linux \
        go build -v -ldflags "-X main.VERSION=$VERSION -s -w" -gcflags "" -o /usr/bin/v2ray-plugin && \
    cd / && upx --best /usr/bin/v2ray-plugin && \
    apk del .build-deps && \
    rm -rf /root/go /root/.cache /tmp/plugin /root/.ash_history

CMD v2ray-plugin $ARGS
