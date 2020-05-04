#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

echo -e "${PASSWORD:-$(hostname)}\n${PASSWORD:-$(hostname)}" | smbpasswd -a -s -c /etc/samba/smb.conf root

exec "$@"
