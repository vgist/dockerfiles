#! /bin/sh
#
# entrypoint.sh

set -xe

if [ -f /etc/pureftpd/pureftpd.passwd ]; then
    cp /etc/pureftpd/pureftpd.passwd /etc/pureftpd.passwd
    /usr/bin/pure-pw mkdb
fi

exec "$@"
