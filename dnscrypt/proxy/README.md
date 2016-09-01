#### Environment:

- LOCAL_IP
- LOCAL_PORT
- RESOLVER_IP
- RESOLVER_PORT
- PROVIDER_NAME
- PROVIDER_KEY

#### Compose example:

    dnscrypt-proxy:
        image: registercn/dnscrypt-proxy
        ports:
            - "5353:5353/udp"
            - "5353:5353/tcp"
        environment:
            - LOCAL_IP=0.0.0.0
            - LOCAL_PORT=5353
            - RESOLVER_IP=178.216.201.222
            - RESOLVER_PORT=2053
            - PROVIDER_NAME=2.dnscrypt-cert.easypi.info
            - PROVIDER_KEY=4C29:9CEB:CF8D:4612:48A8:B2F2:3B6F:A046:EBF5:2F2B:6433:27C6:5F3A:88F5:495E:3075
        restart: always

#### Creating an instance:

    docker run -it --name dnscrypt-proxy -p 5353:5353/tcp -p 5353:5353/udp \
        -e LOCAL_IP=0.0.0.0
        -e LOCAL_PORT=5353 \
        -e PROVIDER_NAME=2.dnscrypt-cert.soltysiak.com \
        -e RESOLVER_IP=178.216.201.222 -e RESOLVER_PORT=2053 \
        registercn/dnscrypt-proxy