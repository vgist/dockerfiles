FROM alpine:3.4
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

RUN set -xe && \
    apk -U add gcc g++ make libatomic readline readline-dev libxml2 libxml2-dev \
        ncurses-terminfo-base ncurses-terminfo \
        libxslt libxslt-dev zlib zlib-dev \
        ruby ruby-dev yaml yaml-dev \
        libffi-dev build-base ruby-io-console ruby-irb ruby-json ruby-rake && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install --no-ri --no-rdoc github-pages && \
    apk del gcc g++ make build-base zlib-dev ruby-dev readline-dev \
        yaml-dev libffi-dev libxml2-dev && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /var/www

WORKDIR /var/www

VOLUME ["/var/www"]

EXPOSE 4000

ENTRYPOINT ["jekyll"]

CMD ["server", "--watch", "--force_polling", "--host", "0.0.0.0"]

