![](https://images.microbadger.com/badges/version/gists/jekyll.svg) ![](https://images.microbadger.com/badges/image/gists/jekyll.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/jekyll>

Automatically built by Github Actions

##### Environment:

| Environment | Default value |
|-------------|---------------|
| UID         | 1000          |
| GID         | 1000          |

##### Volume:

- /var/www

##### Custom usage:

    docker run \
        -d \
        --name jekyll \
        -p 4000:4000 \
        -e UID=1000
        -e GID=1000
        -v /var/www:/var/www \
        gists/jekyll

Just build

    docker run \
        --rm \
        -it \
        -v /var/www:/var/www \
        gists/jekyll jekyll build # override CMD

##### Compose example:

    jekyll:
        image: gists/jekyll
        ports:
            - "4000:4000"
        volumes:
            - /var/www:/var/www
    restart: always
