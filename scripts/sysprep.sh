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

# remove ssh host keys, they need to be unique and will be regenerated
rm -fv /etc/ssh/*key*

# remove random seed, needs to be unique and will be regenerated
rm -fv /var/lib/random-seed

