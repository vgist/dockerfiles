FROM alpine:3.12

ARG VERSION

RUN set -xe && apk add --no-cache iptables ppp pptpd

COPY rootfs /

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["pptpd", "--fg"]
