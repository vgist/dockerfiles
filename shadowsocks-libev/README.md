
#### Environment:

- SERVER_ADDR
- SERVER_PORT
- PASSWORD
- METHOD
- TIMEOUT
- DNS_ADDR

#### Creating an instance:

    docker run -d --name shadowsocks -p 8443:8443 -p 8443:8443/udp -e SERVER_PORT=8443 -e PASSWORD=EQdFUYal registercn/shadowsocks-libev

#### Compose example:

    shadowsocks:
      image: registercn/shadowsocks-libev
      ports:
        - "8443:8443/tcp"
        - "8443:8443/udp"
      environment:
        - SERVER_PORT=8443
        - PASSWORD=EQdFUYal
      restart: always

#### Please note:

You can't run the container on the port below than 1024 because of the running user nobody, but you can forward the port.

    docker run -d --name shadowsocks -p 443:8443 -p 443:8443/udp -e SERVER_PORT=8443 -e PASSWORD=EQdFUYal registercn/shadowsocks-libev
