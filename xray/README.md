![](https://images.microbadger.com/badges/version/gists/xray.svg) ![](https://images.microbadger.com/badges/image/gists/xray.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/xray>

Automatically built by Github Actions

#### Creating an instance:

    docker run \
        -d \
        --name xray \
        -p 12345:1080 \
        -v $(pwd)/config.json:/etc/xray/config.json \
        gists/xray

#### Compose example:

    v2ray:
        image: gists/xray
        ports:
            - "12345:1080"
        volumes:
            - ./config.json:/etc/xray/config.json
      restart: always
