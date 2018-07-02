![](https://images.microbadger.com/badges/version/gists/rtorrent.svg) ![](https://images.microbadger.com/badges/image/gists/rtorrent.svg) ![](https://img.shields.io/docker/stars/gists/rtorrent.svg) ![](https://img.shields.io/docker/pulls/gists/rtorrent.svg)

#### Volume

- /download

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
        --name rtorrent \
        -p 80:8080 \
        -p 12345:55000 \
        -v /your/data:/download \
        -e USERNAME=yourname \
        -e PASSWORD=yourpassword \
        gists/rtorrent

#### Compose example:

    rtorrent:
      image: gists/rtorrent
      ports:
        - "80:8080"
        - "12345:55000/tcp"
      volumes:
        - /your/data:/download
      environment:
        - USERNAME=yourname
        - PASSWORD=yourpassword
      restart: always
