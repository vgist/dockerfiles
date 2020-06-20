![](https://images.microbadger.com/badges/version/gists/dnsmasq.svg) ![](https://images.microbadger.com/badges/image/gists/dnsmasq.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/dnsmasq>

Automatically built by Github Actions

#### Volume:

- /etc/dnsmasq.d

#### Custom usage:

    docker run \
        -d \
        --name dnsmasq \
        -p 53:53/tcp \
        -p 53:53/udp \
        -v ./dnsmasq.d:/etc/dnsmasq.d \
        gists/dnsmasq

#### Compose example:

    dnsmasq:
      image: gists/dnsmasq
      ports:
        - "53:53/tcp"
        - "53:53/udp"
      volumes:
        - ./dnsmasq.d:/etc/dnsmasq.d
      restart: always
