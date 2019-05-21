![](https://images.microbadger.com/badges/version/gists/frps.svg) ![](https://images.microbadger.com/badges/image/gists/frps.svg) ![](https://img.shields.io/docker/stars/gists/frps.svg) ![](https://img.shields.io/docker/pulls/gists/frps.svg)

#### Creating an instance:

    docker run \
        -d \
        --name frps \
        -p 7000:7000 \
        -v $(pwd)/frps.ini:/etc/frps.ini
        gists/frpc

#### Compose example:

    frps:
        image: gists/frps
        ports:
            - "7000:7000"
        volumes:
            - ./frps.ini:/etc/frps.ini
      restart: always

#### Read More

[https://github.com/fatedier/frp](https://github.com/fatedier/frp)
