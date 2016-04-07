#!/bin/bash
# new server
# Author: HoangHH
# Date: Mar 1, 2016

# basic
sudo yum update -y
sudo yum install epel-release -y
sudo yum install vim xz tmux ntp git zip unzip wget curl telnet -y

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

wget https://services.gradle.org/distributions/gradle-2.12-all.zip
unzip gradle-2.12-all.zip &> /dev/null
sudo mkdir -p /opt/gradle
sudo chown hoanghh /opt/gradle
mv gradle-2.12 /opt/gradle/
sudo ln -s /opt/gradle/gradle-2.12/bin/gradle /bin/gradle
cd 

# check mk
sudo yum install check-mk-agent xinetd -y
sudo /etc/init.d/xinetd start
sudo chkconfig xinetd on

#sudo vim /etc/ssh/sshd_config



sudo sed -i 's/^GSSAPIAuthentication yes$/GSSAPIAuthentication no/' /etc/ssh/sshd_config
sudo /etc/init.d/sshd restart

sudo vim /etc/sysconfig/iptables
sudo /etc/init.d/iptables restart

yum install MariaDB-server MariaDB-client -y