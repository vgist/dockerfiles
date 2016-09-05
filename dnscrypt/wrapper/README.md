![](https://img.shields.io/badge/dnscrypt--wrapper-0.2.2-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-edge-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/dnscrypt-wrapper.svg) ![](https://img.shields.io/docker/pulls/gists/dnscrypt-wrapper.svg)

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
    image: gists/dnscrypt-wrapper
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
