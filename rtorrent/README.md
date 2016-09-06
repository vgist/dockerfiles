![](https://img.shields.io/badge/rtorrent-0.9.6-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.4-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/rtorrent.svg) ![](https://img.shields.io/docker/pulls/gists/rtorrent.svg)

#### Volume

- /download

#### Environment:

- USERNAME
- PASSWORD
- UID
- GID

#### Creating an instance:

    docker run -d --name rtorrent -p 80:8080  -p 12345:55000 -v /your/data:/download -e USERNAME=yourname -e PASSWORD=yourpassword gists/rtorrent

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
