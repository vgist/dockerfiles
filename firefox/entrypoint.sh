#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

addgroup -g ${GID} -S firefox
adduser -u ${UID} -G firefox -h /home/firefox -D firefox

exec su-exec firefox:firefox "$@"
