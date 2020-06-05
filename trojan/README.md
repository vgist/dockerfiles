![](https://images.microbadger.com/badges/version/gists/trojan.svg) ![](https://images.microbadger.com/badges/image/gists/trojan.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/trojan>

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
        - /your/data:/home/ftpuser
        - ./config.json:/etc/trojan/config.json
      restart: always