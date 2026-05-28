PARAMS="pcie_aspm=off pcie_aspm.policy=performance intel_idle.max_cstate=1"

for param in $PARAMS; do
    if ! grep -q "\b$param\b" /boot/grub/grub.cfg; then
        sed -i '/linux .*vmlinuz/ s/$/ '"$param"'/' /boot/grub/grub.cfg
    fi
done

parted -f -s /dev/sda resizepart 2 100%

losetup /dev/loop0 /dev/sda2 2> /dev/null
resize2fs -f /dev/loop0

reboot