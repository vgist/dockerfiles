![](https://img.shields.io/badge/Pure--FTPd-1.0.42-brightgreen.svg) ![](https://img.shields.io/badge/Alpine-edge-brightgreen.svg) ![](https://img.shields.io/docker/stars/gists/pure-ftpd.svg) ![](https://img.shields.io/docker/pulls/gists/pure-ftpd.svg)

#### Volume

- /home/ftpuser
- /etc/pureftpd.pdb

#### Environment:

- LISTEN_PORT
- PASV_PORT
- PUBLIC_HOST

#### Creating an instance:

    docker run -d -p 21:21 -p 30000-30009:30000-30009 -v $(pwd)/pureftpd.pdb:/etc/pureftpd.pdb -v /your/data:/home/ftpuser gists/pure-ftpd

#### Compose example:

    transmission:
      image: gists/pure-ftpd
      ports:
        - "21:21"
        - "30000-30009:30000-30009"
      volumes:
        - ./pureftpd.pdb:/etc/pureftpd.pdb
        - /your/data:/home/ftpuser
      restart: always

##### ftpuser is OS user, test_user is the FTP virtual user

    pure-pw useradd test_user -u ftpuser -d /home/ftpuser/test_user -m

##### refresh pure-ftpd password file or the new ftp user is unable to login

    pure-pw mkdb

#### pure-ftpd

```
/usr/sbin/pure-ftpd # path to pure-ftpd executable
-C 10 # --maxclientsperip (no more than 10 requests from the same ip)
-l puredb:/etc/pureftpd.pdb # --login (login file for virtual users)
-E # --noanonymous (only real users)
-j # --createhomedir (auto create home directory if it doesnt already exist)
-R # --nochmod (prevent usage of the CHMOD command)
-P $PUBLIC_HOST # IP/Host setting for PASV support, passed in your the PUBLIC_HOST env var
-p 30000:30009 # PASV port ranges
```
