FROM alpine:3.19

ARG VERSION

RUN set -xe && \
    apk add --no-cache haproxy

CMD ["/usr/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg", "-db"]
