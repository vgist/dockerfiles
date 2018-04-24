![](https://img.shields.io/badge/Transmission-2.92-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.7-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/transmission.svg) ![](https://img.shields.io/docker/pulls/gists/transmission.svg)

#### Volume

- /data

#### Environment:

| Environment | Default value |
|-------------|---------------|
| RPC_PORT    | 9091          |
| PEERPORT    | 51413         |
| USERNAME    | username      |
| PASSWORD    | $(hostname)   |

#### Custom usage:

    docker run \
        -d \
        --name transmission \
        -p 8080:9091 \
        -v /your/data:/data \
        -e USERNAME=username
        -e PASSWORD=password
        gists/transmission

#### Compose example:

    transmission:
      image: gists/transmission
      ports:
        - "8080:9091"
        - "51413:51413"
        - "51413:51413/udp"
      volumes:
        - /your/data:/data
      environment:
        - USERNAME=username
        - PASSWORD=password
      restart: always
