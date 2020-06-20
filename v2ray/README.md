![](https://images.microbadger.com/badges/version/gists/v2ray.svg) ![](https://images.microbadger.com/badges/image/gists/v2ray.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/v2ray>

Automatically built by Github Actions

#### Creating an instance:

    docker run \
        -d \
        --name v2ray \
        -p 12345:1080 \
        -v $(pwd)/config.json:/etc/v2ray/config.json \
        gists/v2ray

#### Compose example:

    v2ray:
        image: gists/v2ray
        ports:
            - "12345:1080"
        volumes:
            - ./config.json:/etc/v2ray/config.json
      restart: always
