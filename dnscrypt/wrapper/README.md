#### Environment:

- RESOLVER_IP
- RESOLVER_PORT
- LISTEN_IP
- LISTEN_PORT
- PROVIDER_NAME

#### Compose example:

```
wrapper:
    container_name: dnsctypt-wrapper
    image: registercn/dnscrypt-wrapper
    ports:
        - "443:443/udp"
        - "443:443/tcp"
    environment:
        - LISTEN_IP=0.0.0.0
        - LISTEN_PORT=443
        - RESOLVER_IP=8.8.8.8
        - RESOLVER_PORT=53
        - PROVIDER_NAME=2.dnscrypt-cert.easypi.info
    restart: always
```

##### Public key

    docker exec -it dnscrypt-wrapper cat README.txt
