FROM --platform=$BUILDPLATFORM golang:alpine AS builder

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG VERSION
ARG CGO_ENABLED=on

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
    mkdir -p /root/plugin && cd /root/plugin && \
    curl -sSL https://github.com/teddysun/xray-plugin/archive/v$VERSION.tar.gz | \
    tar xz --strip 1 && \
    go build -v -ldflags "-X main.VERSION=$VERSION -s -w" -gcflags "" -o /xray-plugin && \
    setcap 'cap_net_bind_service=+ep' /xray-plugin


FROM alpine:3.17

COPY --from=builder /xray-plugin /usr/bin/

CMD xray-plugin -version
