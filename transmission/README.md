![](https://images.microbadger.com/badges/version/gists/transmission.svg) ![](https://images.microbadger.com/badges/image/gists/transmission.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/transmission>

Automatically built by Github Actions

#### Volume

- /data

#### Environment:

| Environment | Default value |
|-------------|---------------|
| UID         | 1000          |
| GID         | 1000          |
| RPC_PORT    | 9091          |
| PEER_PORT   | 51413         |
| USERNAME    | username      |
| PASSWORD    | $(hostname)   |

#### Custom usage:

    docker run \
        -d \
        --name transmission \
        -p 8080:9091 \
        -p 51413:51413 \
        -v /your/data:/data \
        -e USERNAME=username \
        -e PASSWORD=password \
        gists/transmission

#### Compose example:

    transmission:
      image: gists/transmission
      ports:
        - "8080:9091"
        - "51413:51413"
      volumes:
        - /your/data:/data
      environment:
        - USERNAME=username
        - PASSWORD=password
      restart: always
