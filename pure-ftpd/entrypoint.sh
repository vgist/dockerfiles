#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

addgroup -g ${GID} -S ftpgroup && adduser -u ${UID} -G ftpgroup -h /home/ftpuser -D -s /sbin/nologin ftpuser

[[ $(stat -c %U /home/ftpuser) == "ftpuser" ]] || chown -R ftpuser /home/ftpuser
[[ $(stat -c %G /home/ftpuser) == "ftpgroup" ]] || chgrp -R ftpgroup /home/ftpuser

[[ -f /etc/pureftpd/pureftpd.passwd ]] && /usr/bin/pure-pw mkdb

exec "$@"
