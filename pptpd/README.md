![](https://images.microbadger.com/badges/version/gists/pptpd.svg) ![](https://images.microbadger.com/badges/image/gists/pptpd.svg) ![](https://img.shields.io/docker/stars/gists/pptpd.svg) ![](https://img.shields.io/docker/pulls/gists/pptpd.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/pptpd>

#### Volume

- /etc/ppp

#### Custom usage:

    docker run \
        -d \
        --name pptpd \
        --privileged \
        -p 1723:1723 \
        -v /local_path/chap-secrets:/etc/ppp/chap-secrets:ro \
        gists/pptpd

#### Compose example:

    pptpd:
      image: gists/pptpd
      ports:
        - "1723:1723"
      volumes:
        - ./local_path/chap-secrets:/etc/ppp/chap-secrets:ro
      privileged: true
      restart: always
