#!/bin/bash

sed -i "s/.*Port .*/Port 2224/g" /etc/ssh/sshd_config
sed -i "s/.*ListenAddress .*/ListenAddress 0.0.0.0/g" /etc/ssh/sshd_config
sed -i "s/.*PasswordAuthentication .*/PasswordAuthentication no/g" /etc/ssh/sshd_config
sed -i "s/.*PermitRootLogin .*/PermitRootLogin no/g" /etc/ssh/sshd_config
sed -i "s/.*MaxAuthTries .*/MaxAuthTries 4/g" /etc/ssh/sshd_config
sed -i "s/.*AllowAgentForwarding .*/AllowAgentForwarding yes/g" /etc/ssh/sshd_config
sed -i "s/.*UseDNS .*/UseDNS no/g" /etc/ssh/sshd_config

# Ya lo hace en user.sh
# echo "${USER_NAME}      ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

service sshd restart