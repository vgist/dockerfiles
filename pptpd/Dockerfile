FROM alpine:3.9

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="PPTP Daemon" \
        org.label-schema.version=$VERSION

RUN set -xe && apk add --no-cache iptables ppp pptpd

COPY etc/pptpd.conf /etc/pptpd.conf
COPY etc/chap-secrets /etc/ppp/chap-secrets
COPY etc/pptpd-options /etc/ppp/pptpd-options
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg"]
