![](https://img.shields.io/badge/dnscrypt--proxy-1.7.0-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.5-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/dnscrypt-proxy.svg) ![](https://img.shields.io/docker/pulls/gists/dnscrypt-proxy.svg)

#### Environment:

| Environment   | Default value                                                                   |
|---------------|---------------------------------------------------------------------------------|
| LOCAL_IP      | 0.0.0.0                                                                         |
| LOCAL_PORT    | 5353                                                                            |
| RESOLVER_IP   | 178.216.201.222                                                                 |
| RESOLVER_PORT | 2053                                                                            |
| PROVIDER_NAME | 2.dnscrypt-cert.soltysiak.com                                                   |
| PROVIDER_KEY  | 25C4:E188:2915:4697:8F9C:2BBD:B6A7:AFA4:01ED:A051:0508:5D53:03E7:1928:C066:8F21 |

#### Custom usage:

    docker run \
        -d \
        --name dnscrypt-proxy \
        -p 5353:5353/tcp \
        -p 5353:5353/udp \
        -e LOCAL_IP=0.0.0.0 \
        -e LOCAL_PORT=5353 \
        -e PROVIDER_NAME=2.dnscrypt-cert.soltysiak.com \
        -e RESOLVER_IP=178.216.201.222 -e RESOLVER_PORT=2053 \
        gists/dnscrypt-proxy

#### Compose example:

    dnscrypt-proxy:
        image: gists/dnscrypt-proxy
        ports:
            - "5353:5353/udp"
            - "5353:5353/tcp"
        environment:
            - USER=nobody
            - LOCAL_IP=0.0.0.0
            - LOCAL_PORT=5353
            - RESOLVER_IP=178.216.201.222
            - RESOLVER_PORT=2053
            - PROVIDER_NAME=2.dnscrypt-cert.easypi.info
            - PROVIDER_KEY=4C29:9CEB:CF8D:4612:48A8:B2F2:3B6F:A046:EBF5:2F2B:6433:27C6:5F3A:88F5:495E:3075
        restart: always

##### Please note:

You can't run the container on the port below than 1024 because of the running user nobody, but you can forward the port.
