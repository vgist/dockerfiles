![](https://img.shields.io/badge/Dnsmasq-2.76-brightgreen.svg) ![](https://img.shields.io/badge/Dnsmasq-3.4-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/dnsmasq.svg) ![](https://img.shields.io/docker/pulls/gists/dnsmasq.svg)

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
