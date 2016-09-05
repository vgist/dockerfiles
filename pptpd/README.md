![](https://img.shields.io/badge/PPTPServer-1.4.0-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.4-brightgreen.svg) ![](https://img.shields.io/docker/stars/registercn/pptpd.svg) ![](https://img.shields.io/docker/pulls/registercn/pptpd.svg)

#### Volume

- /etc/ppp

#### Creating an instance:

    docker run -it --name pptpd --privileged -p 1723:1723 -v /local_path/chap-secrets registercn/pptpd

#### Compose example:

    pptpd:
      image: registercn/pptpd
      ports:
        - "1723:1723"
      volumes:
        - ./local_path/chap-secrets:/etc/ppp/chap-secrets:ro
      privileged: true
      restart: always
