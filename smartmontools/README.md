![](https://img.shields.io/badge/smartmontools-1.1-brightgreen.svg) ![](https://images.microbadger.com/badges/image/gists/smartmontools.svg) ![](https://img.shields.io/badge/Alpine-3.7-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/smartmontools.svg) ![](https://img.shields.io/docker/pulls/gists/smartmontools.svg)


#### Custom usage:

    docker run \
        -d \
        --privileged \
        --name smartmontools \
        gists/smartmontools

#### Compose with your own configuration:

    smartmontools:
        image: gists/smartmontools
        privileged: true
        volumes:
            - ./smartd.conf:/etc/smartd.conf
            - ./ssmtp.conf:/etc/ssmtp/ssmtp.conf
            - ./revaliases:/etc/ssmtp/revaliases
        restart: always
