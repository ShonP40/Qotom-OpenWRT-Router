parted -f -s /dev/sda resizepart 2 100%

losetup /dev/loop0 /dev/sda2 2> /dev/null
resize2fs -f /dev/loop0

reboot
