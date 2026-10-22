FROM --platform=$BUILDPLATFORM golang:alpine AS builder

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG VERSION
ARG CGO_ENABLED=off

ENV GOOS=$TARGETOS \
    GOARCH=$TARGETARCH

# Let's roll
RUN set -xe && \
    apk add --no-cache \
        --virtual .build-deps \
        curl \
        build-base \
        git \
        libcap && \
    mkdir -p /root/v2ray-plugin && cd $_ && \
    curl -sSL https://github.com/shadowsocks/v2ray-plugin/archive/v$VERSION.tar.gz | \
    tar xz --strip 1 && \
    GOOS=$TARGETOS GOARCH=$TARGETARCH CGO_ENABLED=0 \
    go build -v -trimpath -ldflags "-X main.VERSION=v$VERSION -s -w -buildid=" -o /v2ray-plugin && \
    setcap 'cap_net_bind_service=+ep' /v2ray-plugin


FROM alpine:3

COPY --from=builder /v2ray-plugin /usr/bin/

SHELL ["/bin/sh", "-c"]

CMD v2ray-plugin -version
