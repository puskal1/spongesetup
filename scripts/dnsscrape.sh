#!/bin/bash

mkdir /root/targets/$1/$2;
crtsh $2 | tee /root/$1/$2/crtsh.txt;
assetfinder-init $2 | tee ./$1/$2/crtsh.txt;
amass-init $2 | tee ./$1/$2/assetfinder.txt;
subfinder-init $1 | tee ./$1/$2/subfinder.txt;
cat ./$1/$2/* | sort -u | httprobe >> ./$1/$2/domains.txt;
rm ./$1/$2/crtsh.txt ./$1/$2/assetfinder.txt ./$1/$2/amass.txt ./$1/$2/subfinder.txt;
