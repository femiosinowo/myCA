#!/bin/bash
echo type in IP
read IP
cat > /etc/sysconfig/network-scripts/ifcfg-eno16777984  <<EOF
# Generated by dracut initrd
NAME=eno16777984
DEVICE=eno16777984
ONBOOT=yes
NETBOOT=yes
#UUID=efccb9cd-9470-43e3-a320-a6e2311ec1a0
IPV6INIT=yes
BOOTPROTO=none
TYPE=Ethernet
PROXY_METHOD=none
BROWSER_ONLY=no
IPADDR=$IP
PREFIX=8
GATEWAY=10.10.10.1
DNS1=10.10.10.11
DNS2=8.8.8.8
DOMAIN=paosin.local
DEFROUTE=yes
IPV4_FAILURE_FATAL=no
IPV6_AUTOCONF=yes
IPV6_DEFROUTE=yes
IPV6_FAILURE_FATAL=no

EOF
