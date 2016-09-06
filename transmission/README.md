#### Volume

- /download

#### Environment:

- UID
- GID

#### Creating an instance:

docker run -d -p 8080:9091 -v /your/data:/download gists/transmission

#### Compose example:

    transmission:
      image: gists/transmission
      ports:
        - "8080:9091"
      volumes:
        - /your/data:/download
      environment:
        - UID=1000
        - GID=1000
      restart: always