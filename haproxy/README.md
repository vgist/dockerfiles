![](https://images.microbadger.com/badges/version/gists/haproxy.svg) ![](https://images.microbadger.com/badges/image/gists/haproxy.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/haproxy>

Automatically built by Github Actions

#### Custom usage:

    docker run \
        -d \
        --name haproxy \
        -p 443:443 \
        -v /your/path/haproxy.cfg:/etc/haproxy/haproxy.cfg \
        gists/haproxy

#### Compose example:

    haproxy:
      image: gists/haproxy
      container_name: nfsd
      ports:
        - "443:443"
      volumes:
        - /your/path/haproxy.cfg:/etc/haproxy/haproxy.cfg
      restart: always
