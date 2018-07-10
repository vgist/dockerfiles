![](https://images.microbadger.com/badges/version/gists/v2ray.svg) ![](https://images.microbadger.com/badges/image/gists/v2ray.svg) ![](https://img.shields.io/docker/stars/gists/v2ray.svg) ![](https://img.shields.io/docker/pulls/gists/v2ray.svg)

#### Creating an instance:

    docker run \
        -d \
        --name v2ray \
        -p 12345:8001 \
        -v $(pwd)/config.json:/etc/v2ray/config.json \
        gists/v2ray

#### Compose example:

    v2ray:
        image: gists/v2ray
        ports:
            - "12345:8001"
        volumes:
            - ./config.json:/etc/v2ray/config.json
      restart: always
