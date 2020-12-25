#!/bin/bash

# Installing prerequisites

yum -y group install "Development Tools"
yum -y install glibc-static libstdc++-static

# Install

wget https://fossies.org/linux/misc/legacy/chkrootkit-0.53.tar.gz
tar xvf chkrootkit*.tar.gz
rm -rf chkrootkit*.tar.gz
cd chkrootkit-*
make sense
mv -f $(pwd) /usr/local
mv /usr/local/chkrootkit-* /usr/local/chkrootkit
ln -s /usr/local/chkrootkit/chkrootkit /usr/local/bin/chkrootkit
