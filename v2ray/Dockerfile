FROM alpine:3.11

ARG VERSION=4.22.1

LABEL maintainer="zgist" \
        org.label-schema.name="V2Ray" \
        org.label-schema.version=$VERSION

ENV PATH /usr/bin/v2ray:$PATH

# Let's roll
RUN set -xe && \
    apk add --no-cache ca-certificates && \
    apk add --no-cache --virtual .build-deps \
        build-base \
        curl \
        git \
        go \
        upx && \
    mkdir -p /etc/v2ray /tmp/v2ray-src /usr/bin/v2ray /var/log/v2ray && \
    cd /tmp/v2ray-src && \
    curl -sSL https://github.com/v2ray/v2ray-core/archive/v$VERSION.tar.gz | tar xz --strip 1 && \
    go mod download && \
    LDFLAGS="-s -w -X v2ray.com/core.codename=user -X v2ray.com/core.build=$(date '+%Y%m%d-%H%M%S') -X v2ray.com/core.version=v$VERSION" && \
    env CGO_ENABLED=0 go build -ldflags "$LDFLAGS" -v -o /usr/bin/v2ray/v2ray ./main && \
    env CGO_ENABLED=0 go build -ldflags "$LDFLAGS" -v -o /usr/bin/v2ray/v2ctl -tags confonly ./infra/control/main && \
    curl -sSL https://github.com/v2ray/geoip/releases/latest/download/geoip.dat -o /usr/bin/v2ray/geoip.dat && \
    curl -sSL https://github.com/v2ray/domain-list-community/releases/latest/download/dlc.dat -o /usr/bin/v2ray/geosite.dat && \
    upx --best /usr/bin/v2ray/v2ray && \
    upx --best /usr/bin/v2ray/v2ctl && \
    apk del .build-deps && cd / && \
    rm -rf /root/go /root/.cache /tmp/v2ray-src /root/.ash_history

COPY config.json /etc/v2ray/config.json

CMD ["/usr/bin/v2ray/v2ray", "-config=/etc/v2ray/config.json"]
