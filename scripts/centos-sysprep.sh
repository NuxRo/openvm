#!/usr/bin/env bash

# script "syspreps" the current install

# remove bash history
unset HISTFILE
rm -fv /root/.bash_history

# remove package history and leftovers
yum clean all

# remove current logs
find /var/log -type f -delete

# remove udev netweork associations (as MACs will change)
rm -fv /etc/udev/rules.d/*-net.rules /etc/udev/rules.d/*persistent*

# remove MACs from ifcfg files
sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-*
sed -i '/UUID/d' /etc/sysconfig/network-scripts/ifcfg-*

# make sure PERSISTENT_DHCP is on, we don't want to lose IPs if DHCP server goes AWOL
for ifcfg in /etc/sysconfig/network-scripts/ifcfg-eth? ; do grep -q PERSISTENT_DHCLIENT=1 $ifcfg || echo PERSISTENT_DHCLIENT=1 >> $ifcfg ; done

# remove ssh host keys, they need to be unique and will be regenerated
rm -fv /etc/ssh/*key*

# remove random seed, needs to be unique and will be regenerated
rm -fv /var/lib/random-seed

