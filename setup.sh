#!/bin/bash

aptInstall(){
echo "Apt Getting and Installing.......";
apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y;
apt install jq -y;
apt install nmap -y;
mkdir ~/bugbounties;
}

setAliases(){
echo "Setting Aliases.......";
mv ~/spongesetup/.bash_aliases ~/.bash_aliases;
mv ~/spongesetup/.bashrc ~/.bashrc;
}

setupGo(){
echo "Setting up go......."
wget https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz;
tar -xvf go1.13.8.linux-amd64.tar.gz;
mv go /usr/local;
mkdir /root/go/bin;
}

setupRuby(){
sudo apt install ruby-full;
apt  install ruby-bundler;
}

subdomainTools(){
echo "Cloning and setting up Subdomain Enum Tools......";
go get -u github.com/tomnomnom/assetfinder;
go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder;
export GO111MODULE=on;
go get -v -u github.com/OWASP/Amass/v3/...;
go get -u github.com/tomnomnom/httprobe;
go get github.com/tomnomnom/waybackurls;
wget https://gist.githubusercontent.com/mhmdiaa/2742c5e147d49a804b408bfed3d32d07/raw/5dd007667a5b5400521761df931098220c387551/waybackrobots.py -O /opt/waybackrobots.py;
git clone https://github.com/FortyNorthSecurity/EyeWitness.git /opt/eyewitness;
}

direnumTools(){
#git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch;
#ln -s /opt/dirsearch/dirsearch.py /usr/local/sbin/dirsearch;
go get github.com/ffuf/ffuf
}

paramTools(){
git clone  https://github.com/s0md3v/Arjun.git /opt/arjun;
}

scanningTools(){
sudo apt install curl git libcurl4-openssl-dev make zlib1g-dev gawk g++ gcc libreadline6-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config ruby ruby-bundler ruby-dev -y;
git clone https://github.com/wpscanteam/wpscan.git /opt/wpscan;
cd wpscan;
bundle install --without test;
gem install wpscan
}




aptInstall;
setAliases;
setupGo;
subdomainTools;
direnumTools;
source ~/.bash_aliases;
source ~/.bashrc;
