![](https://images.microbadger.com/badges/version/gists/nfs-server.svg) ![](https://images.microbadger.com/badges/image/gists/nfs-server.svg)

Dockerfile <https://github.com/vgist/dockerfiles/tree/master/nfs-server>

Automatically built by Github Actions

#### Environment:

| Environment   | Default value |
|---------------|---------------|
| NFS_DIR       | /nfs-share    |
| NFS_DOMAIN    | *             |
| NFS_OPTION    | `fsid=0,ro,sync,insecure,all_squash,anonuid=65534,anongid=65534,no_subtree_check,nohide` |

#### Custom usage:

    docker run \
        -d \
        --name nfs-server \
        --cap-add=SYS_ADMIN,SETPCAP \
        -p 2049:2049 \
        -v /your/path:/nfs-share \
        -e "NFS_DOMAIN=ip" # The visitor IP range
        gists/nfs-server

#### Compose example:

    nfs-server:
      image: gists/nfs-server
      container_name: nfs-server
      ports:
        - "2049:2049"
      # https://docs.docker.com/engine/reference/run/#runtime-privilege-and-linux-capabilities
      cap_add:
        - SYS_ADMIN
        - SETPCAP
      environment:
        - "NFS_DOMAIN=ip" # The visitor IP range
      volumes:
        - /your/path:/nfs-share
      restart: always

#### Client:

    # nfs v4
    sudo mount -v -t nfs -o vers=4,port=2049 ip:/ /path
