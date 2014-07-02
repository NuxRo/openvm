# pre
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/pre.ks

# install 
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/install.ks

# selinux, firewall
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/security.ks

# partitions and bootloader
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/partitions.ks

# packages
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/packages_start.ks
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/packages.ks
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/packages_end.ks

# services
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/services.ks

# post
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/post.ks
%include http://dl.openvm.eu/cloudstack/centos/ks/vanilla/6/post_end.ks

