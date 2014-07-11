skipx
text
install
reboot
lang en_US.UTF-8
keyboard us
timezone --utc GMT


# repos
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/repos.ks

# selinux, firewall
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/security.ks

# partitions and bootloader
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/partitions.ks

# packages
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/packages_start.ks
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/packages.ks
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/packages_end.ks

# services
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/services.ks

# post
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/post_start.ks
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/post_sysprep.ks
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/post_cloudstack.ks
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/7/post_end.ks

