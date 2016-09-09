![](https://img.shields.io/badge/PPTPServer-1.4.0-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.4-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/pptpd.svg) ![](https://img.shields.io/docker/pulls/gists/pptpd.svg)

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
