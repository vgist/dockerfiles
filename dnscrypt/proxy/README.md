![](https://images.microbadger.com/badges/version/gists/dnscrypt-proxy.svg) ![](https://images.microbadger.com/badges/image/gists/dnscrypt-proxy.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/dnscrypt/proxy>

Automatically built by Github Actions

#### Environment:

| Environment   | Default value                                                                   |
|---------------|---------------------------------------------------------------------------------|
| LOCAL_PORT    | 5353                                                                            |

#### Custom usage:

    docker run \
        -d \
        --name dnscrypt-proxy \
        -p 5353:5353/tcp \
        -p 5353:5353/udp \
        -v /your/dnscrypt-proxy.toml :/etc/dnscrypt-proxy/dnscrypt-proxy.toml
        gists/dnscrypt-proxy

#### Compose example:

    dnscrypt-proxy:
        image: gists/dnscrypt-proxy
        ports:
            - "5353:5353/udp"
            - "5353:5353/tcp"
        volumes:
            - /your/dnscrypt-proxy.toml:/etc/dnscrypt-proxy/dnscrypt-proxy.toml
        restart: always

##### Please note:

You can't run the container on the port below than 1024 because of the running user nobody, but you can forward the port.
