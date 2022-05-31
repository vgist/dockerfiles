FROM alpine:3.16

ARG VERSION

RUN apk add --no-cache --virtual .deps tar curl && \
    ARCH=$(apk info --print-arch) && \
    case "$ARCH" in \
        x86)    _arch=i386      ;; \
        armv7)  _arch=armhf     ;; \
        *)      _arch="$ARCH"   ;; \
    esac && \
    cd /tmp && \
    curl -sSL https://install.speedtest.net/app/cli/ookla-speedtest-${VERSION}-linux-${_arch}.tgz | tar xz && \
    mv /tmp/speedtest /usr/local/bin/ && \
    rm -rf /tmp/speedtest.* && \
    apk del .deps

CMD ["/usr/local/bin/speedtest", "--accept-license", "--accept-gdpr"]
