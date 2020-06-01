FROM alpine:3.12

ARG VERSION

RUN set -ex && \
    apk add --no-cache mpd

COPY mpd.conf /etc/mpd.conf

VOLUME /var/lib/mpd

EXPOSE 6600

CMD ["mpd", "--stdout", "--no-daemon"]
