#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

if [ -f /etc/pureftpd/pureftpd.passwd ]; then
    cp /etc/pureftpd/pureftpd.passwd /etc/pureftpd.passwd
    /usr/bin/pure-pw mkdb
fi

exec "$@"
