#!/bin/bash
# new server
# Author: HoangHH
# Date: Mar 1, 2016

# basic
sudo yum update -y
sudo yum install epel-release -y
sudo yum install vim xz tmux ntp git zip unzip -y

# Time
sudo mv /etc/localtime /etc/localtime.bak
sudo ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime

sudo mv /etc/sysconfig/clock /etc/sysconfig/clock.bak
sudo sh -c "echo 'ZONE=\"Asia/Ho_Chi_Minh\"' > /etc/sysconfig/clock"
sudo /etc/init.d/crond restart

# ntpd
sudo /etc/init.d/ntpd start
sudo chkconfig ntpd on

# ranger
git clone https://github.com/hut/ranger.git
cd ranger && ./setup.py install
cd

# check mk
sudo yum install check-mk-agent -y
sudo /etc/init.d/xinetd start
sudo chkconfig xinetd on

