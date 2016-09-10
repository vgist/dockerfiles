#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

[[ -f /etc/pureftpd/pureftpd.passwd ]] && /usr/bin/pure-pw mkdb

exec "$@"
