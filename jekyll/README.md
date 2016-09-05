#### Volume:

- /var/www

#### Creating an instance:

    docker run -d -p 4000:4000 -v /jekyll/path:/var/www registercn/jekyll

#### Volume permission

run container with `-u uid:gid`

    docker run -u 1000:1000 -d -p 4000:4000 -v /jekyll/path:/var/www registercn/jekyll

#### Compose example:

    jekyll:
        image: registercn/jekyll
        ports:
            - "4000:4000"
        volumes:
            - ./:/var/www
        restart: always

#### Just build:

    docker run --rm -it -v /jekyll/path:/var/www registercn/jekyll jekyll build # override CMD
