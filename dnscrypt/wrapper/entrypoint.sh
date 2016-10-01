#! /bin/sh
#
# entrypoint.sh

set -e

[[ "$DEBUG" == "true" ]] && set -x

if [ ! -f /var/lib/dnscrypt-wrapper/1.key ]; then
    cd /var/lib/dnscrypt-wrapper && \
    dnscrypt-wrapper --gen-provider-keypair > README.txt && \
    dnscrypt-wrapper --gen-crypt-keypair --crypt-secretkey-file=1.key && \
    dnscrypt-wrapper --gen-cert-file --crypt-secretkey-file=1.key --provider-cert-file=1.cert
fi

exec "$@"
