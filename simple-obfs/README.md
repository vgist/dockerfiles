![](https://img.shields.io/badge/simple--obfs-0.0.2-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.5-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/simple-obfs.svg) ![](https://img.shields.io/docker/pulls/gists/simple-obfs.svg)

#### Environment:

| Environment   | Default value  |
|---------------|----------------|
| SERVER_ADDR   | 0.0.0.0        |
| SERVER_PORT   | 8443           |
| obfs          | http           |
| REMOTE_SERVER | 127.0.0.1:8388 |

#### Creating an instance:

    docker run \
        -d \
        --name obfs \
        -p 8443:8443 \
        -e REMOTE_SERVER=127.0.0.1:8388    # Forward traffic to this remote server address
        gists/simple-obfs

#### Compose example:

    shadowsocks:
      image: gists/simple-obfs
      ports:
        - "8443:8443"
      environment:
        - REMOTE_SERVER=127.0.0.1:8388
      restart: always
