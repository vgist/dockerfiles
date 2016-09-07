FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

RUN set -xe && \
    apk add --no-cache dnsmasq && \

    # Set
    echo "conf-dir=/etc/dnsmasq.d/,*.conf" >> /etc/dnsmasq.conf && \
    echo "no-negcache" >> /etc/dnsmasq.conf && \
    echo "local-ttl=300" >> /etc/dnsmasq.conf && \
    echo "no-poll" >> /etc/dnsmasq.conf && \
    echo "cache-size=10000" >> /etc/dnsmasq.conf

COPY dnsmasq.d /etc/

VOLUME ["/etc/dnsmasq.d"]

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["dnsmasq", "--no-daemon", "--user=dnsmasq", "--group=dnsmasq"]
