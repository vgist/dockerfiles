Dockerfile https://github.com/vgist/dockerfiles/tree/master/zerotier/

#### Creating an instance

    docker run -d \
        --name zerotier \
        -v /your/data:/var/lib/zerotier-one \
        gists/zerotier

#### Compose example

    zerotier:
        image:gists/zerotier
        volumes:
          - /your/data:/var/lib/zerotier-one
        restart: always

#### Others

You may need parameters `--cap-add=NET_ADMIN` `--device=/dev/net/tun` to solve network privilege issue.

Follow introduction <https://docs.zerotier.com/zerotier/moons/> to create your own moon node.
