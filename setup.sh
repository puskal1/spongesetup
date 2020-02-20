#!/bin/bash

echo "Updating System......."
apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y;

echo "Setting Aliases......."
mv ./bash_aliases > ~/.bash_aliases;
source ~/.bash_aliases;

echo "Setting up go......."
wget https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz
tar -xvf go1.13.8.linux-amd64.tar.gz
mv go /usr/local;

cat << EOF >> ~/.bashrc
export GOROOT=/usr/local/go
export GOPATH=\$HOME/go
export PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH
EOF
mkdir /root/go/bin;

echo "Cloning and setting up Subdomain Enum Tools......"

go get -u github.com/tomnomnom/assetfinder;
go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder
go get -v -u github.com/OWASP/Amass/v3/...;

echo "Cloning Dirsearch"

git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch;
ln -s /opt/dirsearch/dirsearch /usr/local/sbin/dirsearch;





