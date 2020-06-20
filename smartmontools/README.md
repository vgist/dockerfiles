![](https://images.microbadger.com/badges/version/gists/smartmontools.svg) ![](https://images.microbadger.com/badges/image/gists/smartmontools.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/smartmontools>

Automatically built by Github Actions

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
