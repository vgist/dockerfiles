![](https://images.microbadger.com/badges/version/gists/pure-ftpd.svg) ![](https://images.microbadger.com/badges/image/gists/pure-ftpd.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/pure-ftpd>

Automatically built by Github Actions

#### Volume

- /home/ftpuser
- /etc/pureftpd

#### Environment:

| Environment   | Default value |
|---------------|---------------|
| PUBLIC_HOST   | localhost     |
| MIN_PASV_PORT | 30000         |
| MAX_PASV_PORT | 30009         |
| UID           | 1000          |
| GID           | 1000          |

#### Custom usage:

    docker run \
        -d \
        --name pure-ftpd \
        -p 21:21 \
        -p 30000-30009:30000-30009 \
        -v $(pwd)/pureftpd:/etc/pureftpd \
        -v /your/data:/home/ftpuser \
        gists/pure-ftpd

**since docker version 1.5 ports can be exported in range**

#### Compose example:

    pure-ftpd:
      image: gists/pure-ftpd
      container_name: pure-ftpd
      ports:
        - "21:21"
        - "30000-30009:30000-30009"
      volumes:
        - /your/data:/home/ftpuser
        - ./pureftpd:/etc/pureftpd
      restart: always

##### ftpuser permision

    docker exec -it pure-ftpd chown ftpuser:ftpuser -R /home/ftpuser

##### ftpuser is OS user, test_user is the FTP virtual user

    docker exec -it pure-ftpd pure-pw useradd test -m -u ftpuser -d /home/ftpuser/test

##### refresh pure-ftpd password file or the new ftp user is unable to login

    docker exec -it pure-ftpd pure-pw mkdb

#### pure-ftpd

/usr/sbin/pure-ftpd # path to pure-ftpd executable

    -C|--maxclientsperip                # num no more than num requests from the same ip
    -l|--login puredb:/etc/pureftpd.pdb # login file for virtual users
    -E|--noanonymous                    # only real users
    -j|--createhomedir                  # auto create home directory if it doesnt already exist
    -R|--nochmod                        # prevent usage of the CHMOD command
    -P IP/Host                          # setting for PASV support, passed in your the PUBLIC_HOST env var
    -p 30000:30009                      # PASV port ranges
