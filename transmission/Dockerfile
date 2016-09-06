FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV UID     1000
ENV GID     1000

# Let's roll
RUN set -xe && \
    apk add --no-cache transmission-daemon && \
    rm -rf /var/cache/apk/*

COPY startup /usr/bin/startup
COPY settings.json /

VOLUME /download

EXPOSE 9091

CMD ["/usr/bin/startup"]