#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

mkdir -p /data/.config /data/.watch /data/downloads

[[ ! -f /data/.config/settings.json ]] && cp /etc/transmission/settings.json /data/.config/settings.json

groupmod -g $GID -o transmission && usermod -u $UID -g $GID -o -d /data transmission

chown transmission:transmission -R /data

exec su-exec transmission:transmission "$@"
