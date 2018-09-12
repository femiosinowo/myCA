# myCA
### Read this
https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/

### Adding Certs to Centos 7
Install the ca-certificates package: 
``` 
yum install ca-certificates
```
Enable the dynamic CA configuration feature: 
```
update-ca-trust force-enable
```
Add it as a new file to /etc/pki/ca-trust/source/anchors/:
``` 
cp foo.crt /etc/pki/ca-trust/source/anchors/
```
Use command: 
```
update-ca-trust extract
```

### Create CSRS
```
openssl req -nodes -newkey rsa:2048 \
-keyout example.key \
-out example.csr \
-subj "/C=US/ST=MD/L=Owings Mills/O=PAOSIN LOCAL/OU=DEVOPS/CN=example.com/emailAddress=your@email.com"
```

## ext sample
```
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = example.com

```
