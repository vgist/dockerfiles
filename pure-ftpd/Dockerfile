FROM alpine:edge
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV LISTEN_PORT 21
ENV PASV_PORT   30000-30009
ENV PUBLIC_HOST localhost

RUN set -ex && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache pure-ftpd && \

    addgroup -g 1000 -S ftpuser && \
    adduser -u 1000 -G ftpuser -h /home/ftpuser -D -s /sbin/nologin ftpuser

VOLUME /home/ftpuser /etc/pureftpd.pdb

EXPOSE 21 30000-30009

CMD /usr/sbin/pure-ftpd \
                        -P $PUBLIC_HOST
                        -p $PASV_PORT
                        -l puredb:/etc/pureftpd.pdb
                        -C 10
                        -E
                        -j
                        -R
