#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

export VOLUME_USER=$(stat -c %U /var/www)
export VOLUME_GROUP=$(stat -c %G /var/www)

deluser nginx
addgroup -g ${GID} -S nginx && adduser -u ${UID} -G nginx -H -D -s /sbin/nologin nginx
mkdir -p /var/www

[[ ${VOLUME_USER} == "nginx" ]] || chown -R nginx /var/www
[[ ${VOLUME_GROUP} == "nginx" ]] || chgrp -R nginx /var/www

exec "$@"
