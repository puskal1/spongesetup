#!/bin/bash

aptInstall(){
echo "Apt Getting and Installing......."
apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y;
apt install jq -y;
}

setAliases(){
echo "Setting Aliases......."
mv ./bash_aliases > ~/.bash_aliases;
source ~/.bash_aliases;
mv ~/spongesetup/.bashrc ~/.bashrc;
source ~/.bashrc;
}

setupGo(){
echo "Setting up go......."
wget https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz
tar -xvf go1.13.8.linux-amd64.tar.gz
mv go /usr/local;
#cat << EOF >> ~/.bashrc
#export GOROOT=/usr/local/go
#export GOPATH=\$HOME/go
#export PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH
#EOF
mkdir /root/go/bin;
}

subdomainTools(){
echo "Cloning and setting up Subdomain Enum Tools......"
go get -u github.com/tomnomnom/assetfinder;
go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder;
go get -v -u github.com/OWASP/Amass/v3/...;
go get -u github.com/tomnomnom/httprobe;
go get github.com/tomnomnom/waybackurls
wget https://gist.githubusercontent.com/mhmdiaa/2742c5e147d49a804b408bfed3d32d07/raw/5dd007667a5b5400521761df931098220c387551/waybackrobots.py -O /opt/waybackrobots.py;
git clone https://github.com/FortyNorthSecurity/EyeWitness.git /opt/eyewitness
}

direnumTools(){
echo "Cloning Dirsearch"
git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch;
ln -s /opt/dirsearch/dirsearch /usr/local/sbin/dirsearch;
}

aptInstall;
setAliases;
setupGo;
subdomainTools;
direnumTools;
