FROM alpine:3.9

ARG VERSION=0.27.0
ARG REPO=github.com/fatedier/frp
ARG URL=https://$REPO/archive/v$VERSION.tar.gz

LABEL maintainer="zgist" \
        org.label-schema.name="frpc" \
        org.label-schema.version=$VERSION

# Let's roll
RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
                                curl \
                                git \
                                build-base \
                                go \
                                upx && \
    mkdir -p /tmp/frp && cd /tmp/frp && \
    curl -sSL $URL | tar xz --strip 1 && \
    go mod download && \
    go build -v -o /usr/bin/frpc ./cmd/frpc && \
    cp ./conf/frpc.ini /etc/ && \
    cd / && upx --best /usr/bin/frpc && \
    rm -rf /root/go /root/.cache /root/.ash_history /tmp/frp && \
    apk del .build-deps

CMD ["/usr/bin/frpc", "-c", "/etc/frpc.ini"]
