FROM alpine:3.11

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="PPTP Daemon" \
        org.label-schema.version=$VERSION

RUN set -xe && apk add --no-cache iptables ppp pptpd

COPY rootfs /

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["pptpd", "--fg"]
