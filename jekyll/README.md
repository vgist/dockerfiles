![](https://img.shields.io/badge/Jekyll-3.2.1-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.4-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/jekyll.svg) ![](https://img.shields.io/docker/pulls/gists/jekyll.svg)

#### Volume:

- /var/www

#### Creating an instance:

    docker run -d -p 4000:4000 -v /jekyll/path:/var/www gists/jekyll

#### Volume permission

run container with `-u uid:gid`

    docker run -u 1000:1000 -d -p 4000:4000 -v /jekyll/path:/var/www gists/jekyll

#### Compose example:

    jekyll:
        image: gists/jekyll
        ports:
            - "4000:4000"
        volumes:
            - ./:/var/www
        restart: always

#### Just build:

    docker run --rm -it -v /jekyll/path:/var/www gists/jekyll jekyll build # override CMD
