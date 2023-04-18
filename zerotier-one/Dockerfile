FROM alpine:3.17

ARG VERSION

ENV PEER_PORT=9993

RUN set -ex && \
    apk add --no-cache zerotier-one

VOLUME ["/var/lib/zerotier-one"]

CMD ["/usr/sbin/zerotier-one"]
