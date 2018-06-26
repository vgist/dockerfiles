![](https://images.microbadger.com/badges/version/gists/simple-obfs.svg) ![](https://images.microbadger.com/badges/image/gists/simple-obfs.svg) ![](https://img.shields.io/docker/stars/gists/simple-obfs.svg) ![](https://img.shields.io/docker/pulls/gists/simple-obfs.svg)

#### Environment:

| Environment | Default value  |
|-------------|----------------|
| SERVER_ADDR | 0.0.0.0        |
| SERVER_PORT | 8388           |
| DNS_SERVER  | 8.8.8.8        |
| OBFS_OPTS   | http           |
| FORWARD     | 127.0.0.1:8388 |
| FAILOVER    | www.163.com:80 |

#### Creating an instance:

    docker run \
        -d \
        --name simple-obfs \
        -p 8388:8388 \
        -e FORWARD=127.0.0.1:8388
        gists/shadowsocks-libev

#### Compose example:

    simple-obfs:
      image: gists/simple-obfs
      ports:
        - "8388:8388"
      environment:
        - FORWARD=127.0.0.1:8388
      restart: always


#### Compose file with own command:

    simple-obfs:
      image: gists/simple-obfs
      ports:
        - "8388:8388"
      command: obfs-server -s 0.0.0.0 -p 8139 --obfs http -r 127.0.0.1:8388
      restart: always
