#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

deluser nginx
addgroup -g ${GID} -S nginx && adduser -u ${UID} -G nginx -H -D -s /sbin/nologin nginx
mkdir -p /var/www
chown -R nginx:nginx /var/www

exec "$@"
