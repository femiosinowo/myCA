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
Use command: update-ca-trust extract
