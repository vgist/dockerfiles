FROM --platform=$BUILDPLATFORM golang:alpine AS builder

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG VERSION
ARG CGO_ENABLED=on

ENV GOOS=$TARGETOS \
    GOARCH=$TARGETARCH

RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
        build-base \
        curl \
        git \
        libcap && \
    mkdir -p /root/xray-src && \
    cd /root/xray-src && \
    curl -sSL https://github.com/XTLS/Xray-core/archive/v$VERSION.tar.gz | tar xz --strip 1 && \
    LDFLAGS="-s -w -buildid=" && \
    go build -v -o /xray -trimpath -ldflags "$LDFLAGS" ./main && \
    setcap 'cap_net_bind_service=+ep' /xray && \
    curl -sSL https://github.com/v2ray/geoip/raw/release/geoip.dat -o /geoip.dat && \
    curl -sSL https://github.com/v2ray/domain-list-community/raw/release/dlc.dat -o /geosite.dat

FROM alpine:3.19

RUN apk add --no-cache ca-certificates && \
    mkdir -p /var/log/xray

COPY --from=builder /xray /usr/bin/
COPY --from=builder /geo* /usr/bin/
COPY config.json /etc/xray/

CMD ["xray", "-config=/etc/xray/config.json"]
