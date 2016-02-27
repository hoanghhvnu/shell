#sudo vim /etc/ssh/sshd_config



sudo sed -i 's/^GSSAPIAuthentication yes$/GSSAPIAuthentication no/' /etc/ssh/sshd_config
sudo /etc/init.d/sshd restart