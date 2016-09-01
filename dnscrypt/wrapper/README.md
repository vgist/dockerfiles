#### Environment:

- RESOLVER_IP
- RESOLVER_PORT
- LISTEN_IP
- LISTEN_PORT
- PROVIDER_NAME

#### Compose example:

```
wrapper:
    image: vimagick/dnscrypt-wrapper
    ports:
        - "443:443/udp"
        - "443:443/tcp"
    environment:
        - LISTEN_ADDR=0.0.0.0:443
        - RESOLVER_ADDR=8.8.8.8:53
        - PROVIDER_NAME=2.dnscrypt-cert.easypi.info
    restart: always
```
