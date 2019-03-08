FROM alpine:3.9

ARG VERSION=3.7.3

LABEL maintainer="zgist" \
        org.label-schema.name="Jekyll" \
        org.label-schema.version=$VERSION

ENV UID     1000
ENV GID     1000

RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
                                build-base \
                                libffi-dev \
                                libxml2-dev \
                                readline-dev \
                                ruby-dev \
                                yaml-dev \
                                zlib-dev && \
    apk add --no-cache --virtual .run-deps \
                                ruby \
                                ruby-bundler \
                                ruby-json \
                                ruby-rake \
                                su-exec && \
    gem install --no-document jekyll:${VERSION} && \
    gem install --no-document jekyll-coffeescript \
                                jekyll-feed \
                                jekyll-gist \
                                jekyll-paginate \
                                jekyll-redirect-from \
                                jekyll-sitemap \
                                minima && \
    apk del .build-deps && \
    mkdir -p /var/www

COPY entrypoint.sh /usr/bin/entrypoint.sh

WORKDIR /var/www
VOLUME ["/var/www"]

EXPOSE 4000

ENTRYPOINT ["/usr/bin/entrypoint.sh"]

CMD ["jekyll", "server", "--watch", "--force_polling", "--host", "0.0.0.0"]
