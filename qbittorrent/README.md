![](https://images.microbadger.com/badges/version/gists/qbittorrent.svg) ![](https://images.microbadger.com/badges/image/gists/qbittorrent.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/qbittorrent>

Automatically built by Github Actions

#### Environment:

| Environment | Default value |
|-------------|---------------|
| PEER_PORT | 6881            |
| WEB_PORT  | 8080            |
| UID       | 1000            |
| GID       | 1000            |

##### username & password

- username: admin
- password: adminadmin

#### Volume

- /data

#### Creating an instance:

    docker run \
        -d \
        --name qbittorrent \
        -p 6881:6881 \
        -p 6881:6881/udp \
        -p 8080:8080 \
        -v /path/data:/data
        gists/qbittorrent

#### Compose example:

    qbittorrent:
        image: gists/qbittorrent
        ports:
            - "8080:8080"
            - "6881:6881"
            - "6881:6881/udp"
        volumes:
            - /path/data:/data
        environment:
            - UID=1000
            - GID=1000
      restart: always
