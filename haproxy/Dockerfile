FROM alpine:3.9

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="haproxy" \
        org.label-schema.version=$VERSION

RUN set -xe && \
    apk add --no-cache haproxy

CMD ["/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-db"]
