![](https://images.microbadger.com/badges/version/gists/frp.svg) ![](https://images.microbadger.com/badges/image/gists/frp.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/frp>

Automatically built by Github Actions

#### Creating an instance:

    docker run \
        -d \
        --name frp \
        -p 7000:7000 \
        -v $(pwd)/frps.ini:/etc/frps.ini \
        gists/frp \
        frpc -c /etc/frpc.ini

#### Compose example:

    frps:
        image: gists/frp
        ports:
            - "7000:7000"
        volumes:
            - ./frps.ini:/etc/frps.ini
        command: frps -c /etc/frps.ini
      restart: always

#### Read More

[https://github.com/fatedier/frp](https://github.com/fatedier/frp)
