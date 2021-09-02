#!/bin/bash

# Actualiza paquetes
dnf update -y
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install -y htop less sudo tree rsync net-tools nc lsof hostname \
               tar zip gzip unzip pigz pcre wget vim \
               openssh-server dnf-plugins-core
# dnf install -y perl git traceroute mlocate
# dnf install -y ntp
# dnf -y groupinstall "Development Tools"
# dnf -y install zlib-devel openssl-devel readline-devel sqlite-devel pcre pcre-devel perl wget git tree vim nc htop ntp unzip netstat traceroute

# Limpieza
dnf -y clean all


