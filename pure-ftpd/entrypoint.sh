#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

addgroup -g ${GID} -S ftpuser && adduser -u ${UID} -G ftpuser -h /home/ftpuser -D -s /sbin/nologin ftpuser

[[ -f /etc/pureftpd/pureftpd.passwd ]] && /usr/bin/pure-pw mkdb

exec "$@"
