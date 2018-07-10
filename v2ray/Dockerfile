FROM alpine:3.8

ARG VERSION=3.29

LABEL maintainer="zgist" \
        org.label-schema.name="V2Ray" \
        org.label-schema.version=$VERSION

# Let's roll
RUN set -xe && \
    apk add --no-cache ca-certificates curl && \
    mkdir -p /usr/bin/v2ray /etc/v2ray /tmp/v2ray /var/log/v2ray && \
    curl -sSLo /tmp/v2ray/v2ray-linux-64.zip https://github.com/v2ray/v2ray-core/releases/download/v$VERSION/v2ray-linux-64.zip && \
    unzip /tmp/v2ray/v2ray-linux-64.zip -d /tmp/v2ray/ && \
    mv /tmp/v2ray/v2ray-v$VERSION-linux-64/v2ray /usr/bin/v2ray/ && \
    mv /tmp/v2ray/v2ray-v$VERSION-linux-64/v2ctl /usr/bin/v2ray/ && \
    mv /tmp/v2ray/v2ray-v$VERSION-linux-64/geoip.dat /usr/bin/v2ray/ && \
    mv /tmp/v2ray/v2ray-v$VERSION-linux-64/geosite.dat /usr/bin/v2ray/ && \
    apk del curl && \
    rm -rf /tmp/v2ray

COPY config.json /etc/v2ray/config.json

ENV PATH /usr/bin/v2ray:$PATH

CMD ["/usr/bin/v2ray/v2ray", "-config=/etc/v2ray/config.json"]
