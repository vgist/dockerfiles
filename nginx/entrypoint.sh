#! /bin/sh
#
# entrypoint.sh

[[ "$DEBUG" == "true" ]] && set -x

groupmod -g ${GID} -o nginx && usermod -u ${UID} -g ${GID} -o nginx

chown nginx:nginx -R /var/lib/nginx
chown nginx:nginx -R /var/www

exec "$@"
