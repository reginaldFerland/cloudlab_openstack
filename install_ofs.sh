#/bin/bash

wget https://s3.amazonaws.com/download.orangefs.org/current/source/orangefs-2.9.6.tar.gz
tar xzf orangefs-2.9.6.tar.gz
cd  orangefs-2.9.6

wget http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
rpm -Uvh epel-release*rpm

yum update -y
yum -y install gcc flex bison openssl-devel libdb4-devel kernel-devel perl make kernel-headers zip openssl automake autoconf patch gcc-c++ openldap openldap-devel kernel-uek-devel-`uname -r`
 
./configure --prefix=/opt/orangefs --with-kernel=/lib/modules/`uname -
r`/build
 
make 
make install
make kmod
make kmod_prefix=/opt/orangefs kmod_install

/opt/orangefs/bin/pvfs2-genconfig /opt/orangefs/etc/orangefs-server.conf
#/opt/orangefs/sbin/pvfs2-server -f -a master /opt/orangefs/etc/orangefs-server.conf
#/opt/orangefs/sbin/pvfs2-server -a master /opt/orangefs/etc/orangefs-server.conf
