#!/bin/bash

# Deshabilita IPv6
echo "NETWORKING_IPV6=no" >> /etc/sysconfig/network
echo "IPV6INIT=no" >> /etc/sysconfig/network
echo "UUID=$(cat /proc/sys/kernel/random/uuid)" >> /etc/sysconfig/network
echo "DNS1=192.168.0.2" >> /etc/sysconfig/network
echo "DNS2=192.100.162.1" >> /etc/sysconfig/network
echo "DNS3=8.8.8.8" >> /etc/sysconfig/network
echo "DOMAIN=se.local" >> /etc/sysconfig/network

# Deshabilita para que Proxmox gestione el /etc/resolv.conf
sed -i "s/.*[main].*/&\ndns=none/" /etc/NetworkManager/NetworkManager.conf
