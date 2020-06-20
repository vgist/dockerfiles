![](https://images.microbadger.com/badges/version/gists/trojan-go.svg) ![](https://images.microbadger.com/badges/image/gists/trojan-go.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/trojan-go>

Automatically built by Github Actions

#### Custom usage:

    docker run \
        -d \
        --name trojan-go \
        -p 443:443 \
        -v $(pwd)/config.json:/etc/trojan-go/config.json \
        -v $(pwd)/your.crt:/any/path/your.crt \             # same path as the config.json
        -v $(pwd)/your.key:/any/path/your.key \
        gists/trojan-go

#### Compose example:

    trojan:
      image: gists/trojan-go
      container_name: trojan-go
      ports:
        - "443:443"
      volumes:
        - ./config.json:/etc/trojan-go/config.json
        - ./your.crt:/any/path/your.crt                     # same path as the config.json
        - ./your.key:/any/path/your.key
      restart: always

- Read more: <https://github.com/p4gefau1t/trojan-go>
