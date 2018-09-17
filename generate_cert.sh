#!/bin/bash

echo enter domain name
#DOMAIN="docker-registry-default.apps.paosin.local"
read DOMAIN

openssl req -nodes -newkey rsa:2048 \
-keyout $DOMAIN.key \
-out $DOMAIN.csr \
-subj "/C=US/ST=MD/L=Owings Mills/O=PAOSIN LOCAL/OU=DEVOPS/CN=$DOMAIN/emailAddress=your@email.com"


cat > $DOMAIN.ext <<EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = $DOMAIN

EOF


openssl x509 -req -in $DOMAIN.csr -CA myCA.pem -CAkey myCA.key -CAcreateserial \
-out $DOMAIN.crt -days 1825 -sha256 -extfile $DOMAIN.ext
