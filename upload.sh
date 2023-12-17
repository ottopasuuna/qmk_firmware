#!/bin/bash
if [ $(id -u) -ne 0 ]; then
    echo "Must run script as root"
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "pass the bin file"
    exit 1
fi

bin_file=$1
echo "Reset your board"
while [ ! -b /dev/sdd1 ]; do
    sleep 1
done

echo "Mounting bootloader"
mount /dev/sdd1 /mnt
echo "Copying file"
cp $bin_file /mnt
umount /mnt
echo "Firmware updated"
