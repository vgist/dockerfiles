FROM alpine:3.7
MAINTAINER UmVnaXN0ZXIgcmVnaXN0ZXJkZWRpY2F0ZWQrZG9ja2VyKGF0KWdtYWlsLmNvbQo=

RUN set -ex && \
    apk add --no-cache bash mariadb mariadb-client tzdata && \
    mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    sed -Ei -e 's/^(bind-address|log)/#&/' \
        -e 's/^\[mysqld\]$/&\nskip-host-cache\nskip-name-resolve\nuser=mysql/' /etc/mysql/my.cnf

COPY docker-entrypoint.sh /

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mysqld"]
