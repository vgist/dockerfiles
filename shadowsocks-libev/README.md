
#### Environment:

- SERVER_ADDR
- SERVER_PORT
- PASSWORD
- METHOD
- TIMEOUT
- DNS_ADDR

#### Creating an instance:

    docker run -d --name shadowsocks -p 8443:8443 -p 8443:8443/udp -e SERVER_PORT=8443 -e METHOD=aes-256-cfb -e PASSWORD=EQdFUYal registercn/shadowsocks-libev

#### Compose example:

    shadowsocks:
      image: registercn/shadowsocks-libev
      ports:
        - "8443:8443/tcp"
        - "8443:8443/udp"
      environment:
        - SERVER_PORT=8443
        - METHOD=aes-256-cfb
        - PASSWORD=EQdFUYal
      restart: always
