#!/bin/bash


# Deshabilita IPv6
echo "NETWORKING_IPV6=no" >> /etc/sysconfig/network
echo "IPV6INIT=no" >> /etc/sysconfig/network

# increase system IP port limits
# http://www.cyberciti.biz/tips/linux-increase-outgoing-network-sockets-range.html
sysctl net.ipv4.ip_local_port_range="1024 65535"

echo "
# increase system IP port limits
net.ipv4.ip_local_port_range = 1024 65535

# Optimization for port usefor LBs
# Increase system file descriptor limit
fs.file-max = 65535
" >> /etc/sysctl.conf