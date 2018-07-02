#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

mkdir -p /download/torrents /download/.watch /download/.session /home/torrent /var/tmp/nginx

[[ ! -f /home/torrent/.rtorrent.rc ]] && cp /etc/rtorrent.rc /home/torrent/.rtorrent.rc
[[ ! -f /home/torrent/scgi.socket ]] && touch /home/torrent/scgi.socket
[[ -f /download/.session/rtorrent.lock ]] && rm -f /download/.session/rtorrent.lock

htpasswd -b -c /var/www/rutorrent/.htpasswd $USERNAME ${PASSWORD:-$(hostname)}

addgroup -g ${GID} torrent && adduser -h /home/torrent -s /bin/sh -G torrent -D -u ${UID} torrent

chown -R torrent:torrent /download
chown -R torrent:torrent /var/www
chown -R torrent:torrent /home/torrent
chown -R torrent:torrent /var/lib/nginx
chown -R torrent:torrent /var/tmp/nginx

/usr/bin/supervisord -c /etc/supervisord.conf
