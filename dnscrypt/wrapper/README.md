![](https://images.microbadger.com/badges/version/gists/dnscrypt-wrapper.svg) ![](https://images.microbadger.com/badges/image/gists/dnscrypt-wrapper.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/dnscrypt/wrapper>

Automatically built by Github Actions

#### Environment:

| Environment   | Default value               |
|---------------|-----------------------------|
| RESOLVER_IP   | 8.8.8.8                     |
| RESOLVER_PORT | 53                          |
| LISTEN_IP     | 0.0.0.0                     |
| LISTEN_PORT   | 443                         |
| PROVIDER_NAME | 2.dnscrypt-cert.easypi.info |

#### Custom usage:

    docker run \
        -d \
        --name dnscrypt-wrapper \
        -p 443:443/tcp \
        -p 443:443/udp \
        -e LISTEN_IP=0.0.0.0 \
        -e LISTEN_PORT=443 \
        -e RESOLVER_IP=8.8.8.8 \
        -e RESOLVER_PORT=53 \
        -e PROVIDER_NAME=2.dnscrypt-cert.easypi.info
        gists/dnscrypt-wrapper

#### Compose example:

    wrapper:
        container_name: dnsctypt-wrapper
        image: gists/dnscrypt-wrapper
        ports:
            - "443:443/udp"
            - "443:443/tcp"
        environment:
            - LISTEN_IP=0.0.0.0
            - LISTEN_PORT=443
            - RESOLVER_IP=8.8.8.8
            - RESOLVER_PORT=53
            - PROVIDER_NAME=2.dnscrypt-cert.easypi.info
        restart: always

##### Public key

    docker exec -it dnscrypt-wrapper cat README.txt
