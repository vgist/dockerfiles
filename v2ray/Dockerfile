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
    mkdir -p /etc/v2ray /root/v2ray-src /usr/bin/v2ray && \
    cd /root/v2ray-src && \
    curl -sSL https://github.com/v2fly/v2ray-core/archive/v$VERSION.tar.gz | tar xz --strip 1 && \
    LDFLAGS="-s -w -X v2ray.com/core.codename=user -X v2ray.com/core.build=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -X v2ray.com/core.version=v$VERSION" && \
    go build -ldflags "$LDFLAGS" -v -o /usr/bin/v2ray/v2ray ./main && \
    go build -ldflags "$LDFLAGS" -v -o /usr/bin/v2ray/v2ctl -tags confonly ./infra/control/main && \
    ls /usr/bin/v2ray/v2* | xargs -n1 setcap 'cap_net_bind_service=+ep' && \
    curl -sSL https://github.com/v2ray/geoip/raw/release/geoip.dat -o /usr/bin/v2ray/geoip.dat && \
    curl -sSL https://github.com/v2ray/domain-list-community/raw/release/dlc.dat -o /usr/bin/v2ray/geosite.dat

FROM alpine:3.12

ENV PATH /usr/bin/v2ray:$PATH

RUN apk add --no-cache ca-certificates && \
    mkdir -p /var/log/v2ray

COPY --from=builder /usr/bin/v2ray /usr/bin/v2ray/
COPY config.json /etc/v2ray/

CMD ["v2ray", "-config=/etc/v2ray/config.json"]
