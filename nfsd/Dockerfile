FROM alpine:3.9

ARG VERSION

LABEL maintainer="zgist" \
        org.label-schema.name="NFS" \
        org.label-schema.version=$VERSION

ENV NFS_DIR /nfs-share
ENV NFS_DOMAIN *
ENV NFS_OPTION rw,fsid=0,sync,no_subtree_check,no_auth_nlm,insecure,no_root_squash,crossmnt,no_acl

RUN set -xe && \
    apk add --no-cache nfs-utils && \
    mkdir -p /var/lib/nfs/v4recovery

COPY nfsd.sh /bin/nfsd.sh

EXPOSE 111/tcp 111/udp 2049/tcp 2049/udp

CMD ["/bin/nfsd.sh"]
