#!/bin/sh
exec >>/root/post.out 2>&1
set -x

## SECURITY

# clear the logs
find /var/log -type f -delete

# clean apt
apt-get clean all

# disable IPv6; alas not yet supported for Cloudstack instances
echo net.ipv6.conf.all.disable_ipv6=1 > /etc/sysctl.d/disableipv6.conf

# delete ssh host keys and ask cloud-init to regenerate them at first boot
# ssh host keys need to be unique
rm -rf /etc/ssh/*key*
mkdir -p /var/lib/cloud/scripts/per-once
echo dpkg-reconfigure openssh-server > /var/lib/cloud/scripts/per-once/sshkeys
chmod +x /var/lib/cloud/scripts/per-once/sshkeys

# delete the random seed
rm -f /var/lib/systemd/random-seed


## PERFORMANCE

# make kernel cmd line more vm friendly
sed -i s/'GRUB_CMDLINE_LINUX_DEFAULT="quiet"'/'GRUB_CMDLINE_LINUX_DEFAULT="vga=0x318 console=ttyS0,115200n8 console=tty0 consoleblank=0 elevator=deadline"'/g /etc/default/grub
update-grub

# implementing some low level settings ad-labam, on CentOS tuned takes care of this - and more
echo kernel.sched_min_granularity_ns=10000000 >> /etc/sysctl.d/tuned.conf
echo kernel.sched_wakeup_granularity_ns=15000000 >> /etc/sysctl.d/tuned.conf
echo vm.dirty_ratio=40 >> /etc/sysctl.d/tuned.conf
echo vm.swappiness=30 >> /etc/sysctl.d/tuned.conf


# OTHER

# delete the udev rules for network devices
find /etc/udev/rules.d/ -name "*persistent*" -delete



# CLOUDSTACK

cat << EOF > /etc/cloud/cloud.cfg.d/99_cloudstack.cfg
datasource:
  CloudStack: {}
  None: {}
datasource_list:
  - CloudStack
EOF

cat << EOF > /etc/cloud/cloud.cfg.d/99_root.cfg
disable_root: 0
ssh_pwauth:   1
EOF

cat << EOF > /etc/cloud/cloud.cfg.d/90_swap.cfg
swap:
   filename: /swap.img
   size: 2147483648
   maxsize: 2147483648
EOF


exit 0
