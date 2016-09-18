#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

deluser lighttpd
addgroup -g ${GID} -S lighttpd && adduser -u ${UID} -G lighttpd -H -D -s /sbin/nologin lighttpd
chown -R lighttpd:lighttpd /var/www

exec "$@"
