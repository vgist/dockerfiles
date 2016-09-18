![](https://img.shields.io/badge/Jekyll-3.2.1-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-3.4-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/jekyll.svg) ![](https://img.shields.io/docker/pulls/gists/jekyll.svg)

#### Environment:

| Environment   | Default value |
|---------------|---------------|
| UID           | 1000          |
| GID           | 1000          |

#### Volume:

- /var/www

#### Custom usage:

    docker run \
        -d \
        --name jekyll \
        -p 4000:4000 \
        -v /jekyll/path:/var/www \
        gists/jekyll

Just build

    docker run \
        --rm \
        -it \
        -v /jekyll/path:/var/www \
        gists/jekyll jekyll build # override CMD

#### Compose example:

    jekyll:
        image: gists/jekyll
        ports:
            - "4000:4000"
        volumes:
            - ./:/var/www
        restart: always
