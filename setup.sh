#!/bin/bash

aptInstall(){
echo "Updating Repos.......";
apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y;
echo "Installing Required Packages"
apt-get install jq nmap ruby-full ruby-bundler python3-pip curl git libcurl4-openssl-dev make zlib1g-dev gawk g++ gcc libreadline6-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config ruby ruby-dev -y;
mkdir ~/bugbounties;
mv ~/spongesetup/.bash_aliases ~/.bash_aliases;
source ~/.bash_aliases;
mv ~/spongesetup/.bashrc ~/.bashrc;
source ~/.bashrc;
mv ~/spongesetup/wordlists ~/wordlists;
echo "Setting up go......."
wget https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz;
tar -xvf go1.13.8.linux-amd64.tar.gz;
mv go /usr/local;
mkdir /root/go/bin;
}

domainTools(){
echo "Cloning and setting up Subdomain Enum Tools......";
git clone https://github.com/yassineaboukir/Asnlookup.git /opt/asnlookup
go get -u github.com/tomnomnom/assetfinder;
go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder;
export GO111MODULE=on;
go get -v -u github.com/OWASP/Amass/v3/...;
go get -u github.com/tomnomnom/httprobe;
go get github.com/tomnomnom/waybackurls;
wget https://gist.githubusercontent.com/nulinc/3e300fd5ff9a1e2169256b86438981bd/raw/5dd007667a5b5400521761df931098220c387551/waybackrobots.py -O /opt/waybackrobots.py;
git clone https://github.com/FortyNorthSecurity/EyeWitness.git /opt/eyewitness;
}

contentDiscoveryTools(){
go get github.com/ffuf/ffuf;
git clone  https://github.com/s0md3v/Arjun.git /opt/arjun;
}

scanningTools(){
git clone https://github.com/wpscanteam/wpscan.git /opt/wpscan;
cd wpscan;
bundle install --without test;
gem install wpscan;
}

aptInstall;
domainTools;
contentDiscoveryTools;
