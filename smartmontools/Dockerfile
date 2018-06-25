FROM alpine:3.7
LABEL maintainer="zgist"

# Let's roll
RUN set -xe && \
    apk add --no-cache \
    smartmontools ssmtp

ENTRYPOINT ["/usr/sbin/smartd", "--debug"]
