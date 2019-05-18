FROM alpine:3.9

ARG VERSION=1.1.0
ARG REPO=github.com/shadowsocks/v2ray-plugin

LABEL maintainer="zgist" \
        org.label-schema.name="v2ray-plugin" \
        org.label-schema.version=$VERSION

ENV ARGS=

# Let's roll
RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
                                git \
                                build-base \
                                go \
                                upx && \
    mkdir -p /root/.cache && cd /root/.cache && go mod init . && \
    go get -d -v $REPO && \
    cd /root/go/pkg/mod/${REPO}@v${VERSION} && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
        go build -v -ldflags "-X main.VERSION=$VERSION -s -w" -gcflags "" -o /usr/bin/v2ray-plugin && \
    cd / && upx --best /usr/bin/v2ray-plugin && \
    rm -rf /root/go /root/.cache /root/.ash_history && \
    apk del .build-deps

CMD v2ray-plugin $ARGS
