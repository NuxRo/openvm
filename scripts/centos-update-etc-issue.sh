#!/usr/bin/env bash

echo Kernel and hostname: > /etc/issue
uname -r >> /etc/issue
hostname -f >> /etc/issue
echo >> /etc/issue
echo IPs, routes, nameservers: >> /etc/issue
ip a| grep inet >> /etc/issue
ip ro | strings >> /etc/issue
grep nameserver /etc/resolv.conf >> /etc/issue
echo >> /etc/issue

