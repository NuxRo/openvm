url	--url=http://mirrors.coreix.net/centos/7/os/x86_64/
repo --name=Updates --baseurl=http://mirrors.coreix.net/centos/7/updates/x86_64/
# epel for cloud-init
repo --name=EPEL --baseurl=http://mirrors.coreix.net/fedora-epel/beta/7/x86_64/

# for cloudstack compatible cloud-init
#repo --name=nuxcloudinit --baseurl=http://li.nux.ro/download/nux/tmp/cloudinit7/
