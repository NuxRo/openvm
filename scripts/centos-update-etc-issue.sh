#!/usr/bin/env bash

# this script can be run from rc.local
# it will update /etc/issue with useful info that will be shown in the tty, before the login prompt

echo Kernel and hostname: > /etc/issue
uname -r >> /etc/issue
hostname -f >> /etc/issue
echo >> /etc/issue
echo IPs, routes, nameservers: >> /etc/issue
ip a| grep inet >> /etc/issue
ip ro | strings >> /etc/issue
grep nameserver /etc/resolv.conf >> /etc/issue
Generated at `date` >> /etc/issue
echo >> /etc/issue

