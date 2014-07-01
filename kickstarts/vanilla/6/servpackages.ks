services --enabled=network,acpid,ntpd,sshd,cloud-init,tuned --disabled=kdump

%packages --excludedocs --nobase
openssl
openssh-server
# cloud-init and growroot will expand the partition and filesystem to match the underlying image
cloud-init
python-jsonpatch
dracut-modules-growroot
cloud-utils-growpart
ntp
wget
acpid
tuned
#do we want EPEL?
#epel-release
-*-firmware
-NetworkManager
-b43-openfwwf
-biosdevname
-fprintd
-fprintd-pam
-gtk2
-libfprint
-mcelog
-redhat-support-tool
-system-config-*
-wireless-tools
%end


