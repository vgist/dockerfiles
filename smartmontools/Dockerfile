FROM alpine:3.13

ARG VERSION

# Let's roll
RUN set -xe && \
    apk add --no-cache \
    smartmontools ssmtp mailx

ENTRYPOINT ["/usr/sbin/smartd", "--debug"]
