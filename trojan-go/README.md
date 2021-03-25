![](https://images.microbadger.com/badges/version/gists/trojan-go.svg) ![](https://images.microbadger.com/badges/image/gists/trojan-go.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/trojan-go>

Automatically built by Github Actions

#### Volume

- /data

### Environment:

| Environment | Default value    |
|-------------|------------------|
| REMOTE      | www.bing.com:80  |
| LOCAL       | 0.0.0.0:443      |
| KEY         | /data/server.key |
| CERT        | /data/server.crt |
| PASSWORD    | $(hostname)      |

#### Custom usage:

    docker run \
        -d \
        --name trojan-go \
        -p 443:443 \
        -v /path/your.crt:/data/server.crt:ro \
        -v /path/your.key:/data/server.key:ro \
        -e PASSWORD=your-password \
        -e REMOTE=127.0.0.1:80 \                    # if your simple Web service is started on port 80
        gists/trojan-go

#### Compose example:

    trojan-go:
      image: gists/trojan-go
      ports:
        - "443:443"
      volumes:
        - /path/your.crt:/data/server.crt:ro
        - /path/your.key:/data/server.key:ro
      environment:
        - PASSWORD=your-password
        - REMOTE=127.0.0.1:80                       # if your simple Web service is started on port 80
      restart: always

or

    trojan-go:
      image: gists/trojan-go
      ports:
        - "443:443"
      volumes:
        - /path/your.crt:/data/server.crt:ro
        - /path/your.key:/data/server.key:ro
        - /path/your-config.json:/data/config.json
      command: trojan-go -config /data/config.json
      restart: always

- Read more: <https://github.com/p4gefau1t/trojan-go>
