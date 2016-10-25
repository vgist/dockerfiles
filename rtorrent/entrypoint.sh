#! /bin/sh
#
# entrypoint.sh

addgroup -g ${GID} torrent && adduser -h /home/torrent -s /bin/sh -G torrent -D -u ${UID} torrent

cp /etc/rtorrent.rc /home/torrent/.rtorrent.rc

mkdir -p /download/torrents /download/.watch /download/.session

htpasswd -b -c /var/www/rutorrent/.htpasswd $USERNAME ${PASSWORD:-$(hostname)}

chown -R torrent:torrent /download
chown -R torrent:torrent /var/www
chown -R torrent:torrent /home/torrent
chown -R torrent:torrent /var/lib/nginx

rm -f /download/.session/rtorrent.lock

/usr/bin/supervisord -c /etc/supervisord.conf
