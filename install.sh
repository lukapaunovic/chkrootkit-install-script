#!/bin/bash

# Installing prerequisites
apt update
apt -y install build-essential

# Download and install chkrootkit
chkrootkit_version="0.58b"
chkrootkit_url="https://fossies.org/linux/misc/chkrootkit-${chkrootkit_version}.tar.gz"

mkdir -p /tmp/chkrootkit_install
cd /tmp/chkrootkit_install || exit 1

curl -LO "$chkrootkit_url"
tar xvf "chkrootkit-${chkrootkit_version}.tar.gz"
rm -f "chkrootkit-${chkrootkit_version}.tar.gz"

cd "chkrootkit-${chkrootkit_version}" || exit 1

# Compile and install chkrootkit
make sense
sudo mv -f "$(pwd)" /usr/local
sudo mv "/usr/local/chkrootkit-${chkrootkit_version}" /usr/local/chkrootkit
sudo ln -s "/usr/local/chkrootkit/chkrootkit" /usr/local/bin/chkrootkit

# Run chkrootkit and filter output
/usr/local/bin/chkrootkit | grep -v -E "not(hing)? (infected|found|tested)"

# Cleanup temporary directory
cd / && sudo rm -rf /tmp/chkrootkit_install

#End
