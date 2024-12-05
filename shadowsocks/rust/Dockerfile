FROM --platform=$BUILDPLATFORM rust:alpine AS builder

ARG VERSION TARGETPLATFORM

RUN set -ex && \
    case "$TARGETPLATFORM" in \
        "linux/386") \
            RUST_TARGET="i686-unknown-linux-musl" \
            MUSL="i686-linux-musl" \
        ;; \
        "linux/amd64") \
            RUST_TARGET="x86_64-unknown-linux-musl" \
            MUSL="x86_64-linux-musl" \
        ;; \
        "linux/arm64") \
            RUST_TARGET="aarch64-unknown-linux-musl" \
            MUSL="aarch64-linux-musl" \
        ;; \
        "linux/arm/v6") \
            RUST_TARGET="arm-unknown-linux-musleabi" \
            MUSL="arm-linux-musleabi" \
        ;; \
        "linux/arm/v7") \
            RUST_TARGET="arm-unknown-linux-musleabihf" \
            MUSL="arm-linux-musleabihf" \
        ;; \
        "linux/ppc64le") \
            RUST_TARGET="powerpc64le-unknown-linux-musl" \
            MUSL="powerpc64le-linux-musl" \
        ;; \
        "linux/riscv64") \
            RUST_TARGET="riscv64-unknown-linux-musl" \
            MUSL="riscv64-linux-musl" \
        ;; \
        "linux/s390x") \
            RUST_TARGET="s390x-unknown-linux-musl" \
            MUSL="s390x-linux-musl" \
        ;; \
        *) \
            echo "Doesn't support $TARGETPLATFORM architecture" \
            exit 1 \
        ;; \
    esac && \
    apk add build-base cmake curl clang18 clang18-libclang llvm18-dev rust-bindgen && \
    curl -sSL https://musl.cc/$MUSL-cross.tgz | tar xzC /root/ && \
    mkdir -p /tmp/ss && cd $_ && \
    curl -sSL https://github.com/shadowsocks/shadowsocks-rust/archive/refs/tags/v$VERSION.tar.gz | \
    tar xz --strip 1 && \
    PATH=/root/$MUSL-cross/bin:$PATH && \
    CC=/root/$MUSL-cross/bin/$MUSL-gcc && \
    rustup override set stable && \
    rustup target add $RUST_TARGET && \
    RUSTFLAGS="-C linker=$CC" CC=$CC cargo build --target $RUST_TARGET --release --features "full" && \
    binary="sslocal ssmanager ssserver ssservice ssurl" && \
    for i in $binary; do mv target/$RUST_TARGET/release/$i /usr/bin/; done

FROM alpine:3

ENV SERVER_ADDR=0.0.0.0:8388 \
    METHOD=aes-256-gcm \
    TIMEOUT=300 \
    DNS_ADDR=8.8.8.8

COPY --from=builder /usr/bin/sslocal /usr/bin/
COPY --from=builder /usr/bin/ssmanager /usr/bin/
COPY --from=builder /usr/bin/ssserver /usr/bin/
COPY --from=builder /usr/bin/ssservice /usr/bin/
COPY --from=builder /usr/bin/ssurl /usr/bin/

EXPOSE $SERVER_PORT

SHELL ["/bin/sh", "-c"]

CMD ssserver \
    -s $SERVER_ADDR \
    -k ${PASSWORD:-$(hostname)} \
    -m $METHOD \
    --timeout $TIMEOUT \
    --dns $DNS_ADDR \
    -U
