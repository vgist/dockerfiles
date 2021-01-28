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
    mkdir -p /root/v2ray-src && \
    cd /root/v2ray-src && \
    curl -sSL https://github.com/v2fly/v2ray-core/archive/v$VERSION.tar.gz | tar xz --strip 1 && \
    LDFLAGS="-s -w -X v2ray.com/core.codename=user -X v2ray.com/core.build=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -X v2ray.com/core.version=v$VERSION" && \
    go build -ldflags "$LDFLAGS" -v -o /v2ray ./main && \
    go build -ldflags "$LDFLAGS" -v -o /v2ctl -tags confonly ./infra/control/main && \
    ls /v2* | xargs -n1 setcap 'cap_net_bind_service=+ep' && \
    curl -sSL https://github.com/v2ray/geoip/raw/release/geoip.dat -o /geoip.dat && \
    curl -sSL https://github.com/v2ray/domain-list-community/raw/release/dlc.dat -o /geosite.dat

FROM alpine:3.13

RUN apk add --no-cache ca-certificates && \
    mkdir -p /var/log/v2ray

COPY --from=builder /v2* /usr/bin/
COPY --from=builder /geo* /usr/bin/
COPY config.json /etc/v2ray/

CMD ["v2ray", "-config=/etc/v2ray/config.json"]
