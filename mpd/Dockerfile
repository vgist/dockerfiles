FROM alpine:3.11

LABEL maintainer="zgist" \
        org.label-schema.name="MPD" \
        org.label-schema.version=$VERSION

RUN set -ex && \
    apk add --no-cache mpd

COPY mpd.conf /etc/mpd.conf

VOLUME /var/lib/mpd

EXPOSE 6600

CMD ["mpd", "--stdout", "--no-daemon"]
