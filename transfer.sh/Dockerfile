FROM alpine:3.9

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="transfer.sh" \
        org.label-schema.version=$VERSION

ENV PORT        8080
ENV PROVIDER    local
ENV BASEDIR     /var/transfer

# Let's roll
RUN set -xe && \
    apk add --no-cache \
    git build-base go && \
    go get github.com/vgist/transfer.sh && \
    mv /root/go/bin/transfer.sh /usr/local/bin && \
    rm -rf /root/go && \
    apk del git build-base go && \
    mkdir -p /var/transfer

VOLUME ["/var/transfer"]

EXPOSE $PORT

CMD /usr/local/bin/transfer.sh \
        --listener :$PORT \
        --provider $PROVIDER \
        --basedir $BASEDIR
