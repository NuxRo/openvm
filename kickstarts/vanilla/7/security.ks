# firewall disabled, leaving the cloud platform to do this
firewall --disabled

selinux --enforcing

# root pw will be randomised later
rootpw password
authconfig --enableshadow --passalgo=sha512

# network on, dhcp on - all platforms expect this
network --onboot yes --device=eth0 --bootproto=dhcp


