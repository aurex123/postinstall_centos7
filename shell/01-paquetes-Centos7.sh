#!/bin/bash

# Actualiza paquetes
yum update -y

yum -y install epel-release
yum -y install pcre perl wget git tree vim nc htop ntp unzip traceroute
# yum -y groupinstall "Development Tools"
# yum -y install zlib-devel openssl-devel readline-devel sqlite-devel pcre pcre-devel perl wget git tree vim nc htop ntp unzip netstat traceroute

# Limpieza
yum -y erase freetype
yum -y clean all