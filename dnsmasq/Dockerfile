FROM alpine:3.12

ARG VERSION

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

CMD ["dnsmasq", "--no-daemon", "--user=dnsmasq", "--group=dnsmasq"]
