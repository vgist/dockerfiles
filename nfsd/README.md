![](https://images.microbadger.com/badges/version/gists/nfsd.svg) ![](https://images.microbadger.com/badges/image/gists/nfsd.svg) ![](https://img.shields.io/docker/stars/gists/nfsd.svg) ![](https://img.shields.io/docker/pulls/gists/nfsd.svg)

#### Environment:

| Environment   | Default value |
|---------------|---------------|
| NFS_DIR       | /nfs-share    |
| NFS_DOMAIN    | *             |
| NFS_OPTION    | `rw,fsid=0,sync,no_subtree_check,no_auth_nlm,insecure,no_root_squash,crossmnt,no_acl` |

#### Custom usage:

    docker run \
        -d \
        --name nfsd \
        --cap-add=SYS_ADMIN,SETPCAP \
        -p 2049:2049/tcp \
        -p 2049:2049/udp \
        -v /your/path:/nfs-share \
        gists/nfsd

#### Compose example:

    nfsd:
      image: gists/nfsd
      container_name: nfsd
      ports:
        - "2049:2049/tcp"
        - "2049:2049/udp"
      cap_add:
        - SYS_ADMIN
        - SETPCAP
      volumes:
        - /your/path:/nfs-share
      restart: always

#### Client:

    # nfs v4
    sudo mount -v -t nfs -o vers=4,port=2049 ip:/ /path
