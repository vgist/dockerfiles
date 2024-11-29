FROM golang:alpine AS builder

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG VERSION
ARG CGO_ENABLED=on

ENV GOOS=$TARGETOS \
    GOARCH=$TARGETARCH

WORKDIR /root
# Let's roll
RUN set -xe && \
    apk add --no-cache \
        --virtual .build-deps \
        curl \
        git \
        libcap && \
    curl -sSL https://github.com/p4gefau1t/trojan-go/archive/v$VERSION.tar.gz | \
    tar xz --strip 1 && \
    mkdir release && \
    go build -v -tags "full" -ldflags "-s -w" -o release && \
    setcap 'cap_net_bind_service=+ep' ./release/trojan-go && \
    curl -sSL https://github.com/v2fly/geoip/raw/release/geoip.dat -o release/geoip.dat && \
    curl -sSL https://github.com/v2fly/domain-list-community/raw/release/dlc.dat -o release/geosite.dat


FROM alpine:3

ENV PATH=/usr/bin/trojan-go:$PATH \
    REMOTE=www.bing.com:80 \
    LOCAL=0.0.0.0:443 \
    KEY=/data/server.key \
    CERT=/data/server.crt \
    PASSWORD=

COPY --from=builder /root/release /usr/bin/trojan-go

VOLUME /data

EXPOSE 443

CMD trojan-go \
    -server \
    -remote $REMOTE \
    -local $LOCAL \
    -key $KEY \
    -cert $CERT \
    -password ${PASSWORD:-$(hostname)}
