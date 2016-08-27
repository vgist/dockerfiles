#### Volume:

- /etc/dnsmasq.d

#### Compose example:

    dnsmasq:
      image: registercn/dnsmasq
      ports:
        - "53:53/tcp"
        - "53:53/udp"
      volumes:
        - ./dnsmasq.d:/etc/dnsmasq.d
      restart: always

#### Creating an instance:

    docker run -d --name dnsmasq -p 53:53/tcp -p 53:53/udp -v ./dnsmasq.d:/etc/dnsmasq.d registercn/dnsmasq
