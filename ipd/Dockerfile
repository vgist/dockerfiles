FROM alpine:3.9

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="ipd" \
        org.label-schema.version=$VERSION

ENV PORT        8080

# Let's roll
RUN set -xe && \
    apk add --no-cache \
    ca-certificates curl git go musl-dev tar && \
    go get -u github.com/mpolden/ipd/... && \
    mv /root/go/bin/ipd /usr/local/bin/ && \
    cd /mnt && \
    curl http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz | tar xz --strip 1 && \
    curl http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz | tar xz --strip 1 && \
    mv /root/go/src/github.com/mpolden/ipd/index.html /mnt/ && \
    rm -rf /root/go && \
    apk del ca-certificates curl git go musl-dev tar

WORKDIR /mnt/

EXPOSE $PORT

ENTRYPOINT [ "/usr/local/bin/ipd", \
            "--country-db", "GeoLite2-Country.mmdb", \
            "--city-db", "GeoLite2-City.mmdb", \
            "--port-lookup", \
            "--reverse-lookup", \
            "--trusted-header", "X-Forwarded-For", \
            "--template", "/mnt/index.html" ]
