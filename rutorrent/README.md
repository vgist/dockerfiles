![](https://images.microbadger.com/badges/version/gists/rutorrent.svg) ![](https://images.microbadger.com/badges/image/gists/rutorrent.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/rutorrent>

Automatically built by Github Actions

#### Volume

- /data

#### Environment:

| Environment | Default value |
|-------------|---------------|
| USERNAME    | admin         |
| PASSWORD    | $(hostname)   |
| UID         | 1000          |
| GID         | 1000          |

#### Custom usage:

    docker run \
        -d \
        --name rutorrent \
        -p 80:8080 \
        -p 55000:55000 \
        -v /your/data:/data \
        -e USERNAME=yourname \
        -e PASSWORD=yourpassword \
        gists/rutorrent

#### Compose example:

    rutorrent:
      image: gists/rtorrent
      ports:
        - "80:8080"
        - "55000:55000/tcp"
      volumes:
        - /your/data:/data
      environment:
        - USERNAME=yourname
        - PASSWORD=yourpassword
      restart: always
