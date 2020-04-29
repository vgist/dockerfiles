FROM alpine:3.11

ARG VERSION

# Let's roll
RUN set -xe && \
    apk add --no-cache \
    smartmontools ssmtp

ENTRYPOINT ["/usr/sbin/smartd", "--debug"]
