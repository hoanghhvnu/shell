#!/bin/bash
# Author: HoangHH
# Date: Mar 3, 2016
# make swap file

size_in_mb=2000
if [ ! -z "$1" ]; then
	size_in_mb="$1"
else
	echo "Please pass size of swap (in MiB) as argument!"
	exit 2
fi

user=`whoami`
if [ "${user}" != "root" ]; then
	echo "ERROR: Must run with root permission!"
	exit 1
fi


echo "Making swap with size ${size_in_mb} MiB, please wait"
dd if=/dev/zero of=/swapfile bs=1024 count=$((1024 * ${size_in_mb}))
mkswap /swapfile
swapon /swapfile

echo -e "\n'/swapfile swap swap defaults 0 0'" >> /etc/fstab