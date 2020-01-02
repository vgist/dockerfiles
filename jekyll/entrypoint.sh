#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

addgroup -g ${GID} -S jekyll && adduser -u ${UID} -G jekyll -H -D -s /sbin/nologin jekyll
mkdir -p /var/www

[[ $(stat -c %U /var/www) == "jekyll" ]] || chown -R jekyll /var/www
[[ $(stat -c %G /var/www) == "jekyll" ]] || chgrp -R jekyll /var/www

exec su-exec jekyll:jekyll "$@"
