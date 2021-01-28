FROM alpine:3.13

ARG VERSION

RUN apk add --no-cache --virtual .deps tar curl && \
    ARCH=$(apk info --print-arch) && \
    case "$ARCH" in \
        x86)    _arch=i386      ;; \
        armv7)  _arch=armhf     ;; \
        *)      _arch="$ARCH"   ;; \
    esac && \
    cd /tmp && \
    curl -sSL https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-${VERSION}-${_arch}-linux.tgz | tar xz && \
    mv /tmp/speedtest /usr/local/bin/ && \
    rm -rf /tmp/speedtest.* && \
    apk del .deps

CMD ["/usr/local/bin/speedtest", "--accept-license", "--accept-gdpr"]
