FROM alpine:3.4
MAINTAINER Register <registerdedicated+docker@gmail.com>

RUN set -ex && \
    apk add -U --no-cache \
    bash \
    mariadb \
    mariadb-client \
    tzdata && \
    mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld && \
    sed -Ei -e 's/^(bind-address|log)/#&/' \
        -e 's/^\[mysqld\]$/&\nskip-host-cache\nskip-name-resolve\nuser=mysql/' /etc/mysql/my.cnf && \
    rm -f /var/cache/apk/*

COPY docker-entrypoint.sh /

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["mysqld"]
