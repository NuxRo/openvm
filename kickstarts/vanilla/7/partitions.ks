zerombr
clearpart --initlabel --all
# One partition to rule them all, no swap
part / --size=1024 --grow --fstype ext4 --asprimary

# we add serial tty for `virsh console`
bootloader --location=mbr --driveorder=vda


