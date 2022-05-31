FROM alpine:3.16

ARG VERSION

# Let's roll
RUN set -xe && \
    apk add --no-cache \
    smartmontools ssmtp mailx

ENTRYPOINT ["/usr/sbin/smartd", "--debug"]
