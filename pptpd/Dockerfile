FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

RUN set -xe && \
    apk add --no-cache iptables ppp pptpd && \
    rm -rf /var/cache/apk/*

COPY etc/pptpd.conf /etc/pptpd.conf
COPY etc/chap-secrets /etc/ppp/chap-secrets
COPY etc/pptpd-options /etc/ppp/pptpd-options
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]
