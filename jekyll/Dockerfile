FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV GITHUB_PAGES_VERSION 94

RUN set -xe && \
    apk add --no-cache --virtual .build-deps build-base && \
    apk add --no-cache --virtual .run-deps libffi-dev zlib-dev libxml2-dev libxslt-dev ruby ruby-dev ruby-bundler ruby-rake ruby-rdoc ruby-irb && \
    gem install --no-document github-pages:${GITHUB_PAGES_VERSION} && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /var/www

WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 4000

ENTRYPOINT ["jekyll"]

CMD ["server", "--watch", "--force_polling", "--host", "0.0.0.0"]

