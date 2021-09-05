#!/bin/bash

sed -ir "s/#\?Port .*/Port 2224/g" /etc/ssh/sshd_config
sed -ir "s/#\?ListenAddress .*/ListenAddress 0.0.0.0/g" /etc/ssh/sshd_config
sed -ir "s/#\?PasswordAuthentication .*/PasswordAuthentication no/g" /etc/ssh/sshd_config
sed -ir "s/#\?PermitRootLogin .*/PermitRootLogin no/g" /etc/ssh/sshd_config
sed -ir "s/#\?MaxAuthTries .*/MaxAuthTries 5/g" /etc/ssh/sshd_config
sed -ir "s/#\?AllowAgentForwarding .*/AllowAgentForwarding yes/g" /etc/ssh/sshd_config
sed -ir "s/#\?UseDNS .*/UseDNS no/g" /etc/ssh/sshd_config

# Ya lo hace en user.sh
# echo "${USER_NAME}      ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

# En Ubuntu o cuando se usa sshd.socket en vez de sshd.service
# sed -i "s/#Port 22/Port 12345/" /etc/ssh/sshd_config
# sed -i "s/ListenStream=22/ListenStream=2224/" /etc/systemd/system/sockets.target.wants/ssh.socket

systemctl restart sshd