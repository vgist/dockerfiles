![](https://images.microbadger.com/badges/image/gists/ipd.svg) ![](https://img.shields.io/badge/Alpine-3.7-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/ipd.svg) ![](https://img.shields.io/docker/pulls/gists/ipd.svg)


#### Environment:

| Environment          | Variable             | Default value |
|----------------------|----------------------|---------------|
| PORT                 | port                 | 8080          |

#### Custom usage:

    docker run \
        -d \
        -p 80:8080
        --name ipd
        gists/ipd

#### Compose example:

    transfer.sh:
        image: gists/ipd
        ports:
            - "80:8080"
        restart: always
