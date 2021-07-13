Dockerfile https://github.com/vgist/dockerfiles/tree/master/zerotier-one/

#### Creating an instance

    docker run -d \
        --name zerotier \
        -v /your/data:/var/lib/zerotier-one \
        gists/zerotier-one

#### Compose example

    zerotier:
        image:gists/zerotier-one
        volumes:
          - /your/data:/var/lib/zerotier-one
        restart: always

#### Others

You may need parameters `--cap-add=NET_ADMIN` `--device=/dev/net/tun` to solve network privilege issue.

Follow introduction <https://www.zerotier.com/manual/#4_4> to create your own moon node.
