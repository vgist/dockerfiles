![](https://images.microbadger.com/badges/version/gists/frpc.svg) ![](https://images.microbadger.com/badges/image/gists/frpc.svg) ![](https://img.shields.io/docker/stars/gists/frpc.svg) ![](https://img.shields.io/docker/pulls/gists/frpc.svg)

#### Creating an instance:

    docker run \
        -d \
        --name frpc \
        -p 7000:7000 \
        -v $(pwd)/frpc.ini:/etc/frpc.ini
        gists/frpc

#### Compose example:

    frpc:
        image: gists/frpc
        ports:
            - "7000:7000"
        volumes:
            - ./frpc.ini:/etc/frpc.ini
      restart: always

#### Read More

[https://github.com/fatedier/frp](https://github.com/fatedier/frp)
