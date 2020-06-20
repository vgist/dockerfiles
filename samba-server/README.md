![](https://images.microbadger.com/badges/version/gists/samba-server.svg) ![](https://images.microbadger.com/badges/image/gists/samba-server.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/samba-server>

Automatically built by Github Actions

#### Volume:

- /mnt

#### Port:

- 137/udp
- 138/udp
- 139/tcp
- 445/tcp

#### Custom usage:

    docker run \
        -d \
        --name samba-server \
        -p 137:137/udp \
        -p 138:138/udp \
        -p 139:139/tcp \
        -p 445:445/tcp \
        -e PASSWORD=yourpassword \
        -v /your/path:/mnt \
        gists/samba-server

#### Compose example:

    samba-server:
      image: gists/samba-server
      container_name: samba-server
      ports:
        - "137:137/udp"
        - "138:138/udp"
        - "139:139/tcp"
        - "445:445/tcp"
      volumes:
        - ./smb.conf:/etc/samba/smb.conf:ro
        - /your/path:/mnt
      environment:
        - PASSWORD=yourpassword
      restart: always

