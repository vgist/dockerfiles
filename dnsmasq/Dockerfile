FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

RUN set -xe && \
    apk add -U --no-cache dnsmasq && \
    rm -rf /var/cache/apk/* &&\

    # Set
    echo "conf-dir=/etc/dnsmasq.d/,*.conf" >> /etc/dnsmasq.conf

COPY dnsmasq.d /etc/

VOLUME ["/etc/dnsmasq.d"]

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["dnsmasq", "--no-daemon", "--user=dnsmasq", "--group=dnsmasq"]
