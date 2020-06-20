![](https://images.microbadger.com/badges/version/gists/trojan.svg) ![](https://images.microbadger.com/badges/image/gists/trojan.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/trojan>

Automatically built by Github Actions

#### Custom usage:

    docker run \
        -d \
        --name trojan \
        -p 443:443 \
        -v $(pwd)/config.json:/etc/trojan/config.json \
        gists/trojan

#### Compose example:

    trojan:
      image: gists/trojan
      container_name: trojan
      ports:
        - "443:443"
      volumes:
        - ./config.json:/etc/trojan/config.json
      restart: always

- Read more: <https://github.com/trojan-gfw/trojan>
