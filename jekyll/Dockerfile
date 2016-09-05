FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

ENV JEKYLL_VERSION  3.2.1

RUN set -xe && \
    apk add --no-cache --virtual .build-deps build-base libffi-dev libxml2-dev readline-dev ruby-dev yaml-dev zlib-dev && \
    apk add --no-cache --virtual .run-deps ruby ruby-bundler ruby-json ruby-rake && \
    gem install --no-document jekyll:${JEKYLL_VERSION} && \
    gem install --no-document jekyll-coffeescript jekyll-feed jekyll-gist jekyll-paginate jekyll-redirect-from jekyll-sitemap minima && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /var/www

WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 4000

CMD ["jekyll", "server", "--watch", "--force_polling", "--host", "0.0.0.0"]

