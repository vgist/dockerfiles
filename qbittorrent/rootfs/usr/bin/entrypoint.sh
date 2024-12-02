#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

adduser -h /data -s /bin/sh -D qbittorrent
groupmod -g ${GID} -o qbittorrent
usermod -u ${UID} -g ${GID} -o qbittorrent

ConfPath=/data/.config/qBittorrent
Config=$ConfPath/qBittorrent.conf

if [ ! -f "$Config" ]; then
    mkdir -p $ConfPath
    cp /etc/qBittorrent.conf $ConfPath
    sed -i "s|Connection\\\PortRangeMin=.*|Connection\\\PortRangeMin=${PEER_PORT}|i" $Config
    sed -i "s|WebUI\\\Port=.*|WebUI\\\Port=${WEB_PORT}|i" $Config
fi

chown -R qbittorrent:qbittorrent /data

exec su-exec qbittorrent:qbittorrent "$@"
