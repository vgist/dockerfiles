#### Environment:

- LOCALIP
- LOCALPORT
- RESOLVERIP
- RESOLVERPORT
- PROVIDER_NAME
- PROVIDER_KEY

#### Compose example:

    dnscrypt-proxy:
        image: registercn/dnscrypt-proxy
        ports:
            - "5353:5353/udp"
            - "5353:5353/tcp"
        environment:
            - LOCALIP=0.0.0.0
            - LOCALPORT=5353
            - RESOLVERIP=178.216.201.222
            - RESOLVERPORT=2053
            - PROVIDER_NAME=2.dnscrypt-cert.easypi.info
            - PROVIDER_KEY=4C29:9CEB:CF8D:4612:48A8:B2F2:3B6F:A046:EBF5:2F2B:6433:27C6:5F3A:88F5:495E:3075
        restart: always

#### Creating an instance:

    docker run -it --name dnscrypt-proxy -p 5353:5353/tcp -p 5353:5353/udp \
        -e LOCALPORT=5353 \
        -e PROVIDER_NAME=2.dnscrypt-cert.soltysiak.com \
        -e RESOLVERIP=178.216.201.222 -e RESOLVERPORT=2053 \
        registercn/dnscrypt-proxy