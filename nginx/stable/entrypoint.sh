#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

deluser nginx
addgroup -g ${GID} -S nginx && adduser -u ${UID} -G nginx -H -D -s /sbin/nologin nginx
chown nginx:nginx /var/lib/nginx

[[ $(stat -c %U /var/www) == "nginx" ]] || chown -R nginx /var/www
[[ $(stat -c %G /var/www) == "nginx" ]] || chgrp -R nginx /var/www

exec "$@"
