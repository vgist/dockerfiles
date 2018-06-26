![](https://images.microbadger.com/badges/version/gists/transfer.sh.svg) ![](https://images.microbadger.com/badges/image/gists/transfer.sh.svg) ![](https://img.shields.io/docker/stars/gists/transfer.sh.svg) ![](https://img.shields.io/docker/pulls/gists/transfer.sh.svg)


#### Environment:

| Environment          | Variable             | Default value |
|----------------------|----------------------|---------------|
| PORT                 | port                 | 8080          |
| PROVIDER             | provider             | local         |
| BASEDIR              | basedir              | /var/transfer |

#### Custom usage:

    docker run \
        -d \
        -p 8080:8080
        --name transfer.sh
        gists/transfer.sh

#### Compose example:

    transfer.sh:
        image: gists/transfer.sh
        ports:
            - "8080:8080"
        volumes:
            - ./transfer:/var/transfer
        restart: always
