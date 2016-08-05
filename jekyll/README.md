#### Volume:

- /var/www

#### Creating an instance:

    docker run --rm -it -p 4000:4000 -v /jekyll/path:/var/www registercn/jekyll jekyll serve --watch --force_polling  --host 0.0.0.0

Beware by default, Jekyll will run on 127.0.0.1 (default gem configuration): this will make jekyll unreachable from outside the docker container. To override this option, just give the extra --host parameter.

#### Compose example:

    version: '2'

    services:
        jekyll:
            container_name: jekyll
            image: registercn/jekyll
            ports:
                - "4000:4000"
            volumes:
                - ./:/var/www
            restart: always

#### Just build:

    docker run --rm -it -v /jekyll/path:/var/www registercn/jekyll jekyll build # override CMD